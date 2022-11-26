package com.DAO;

import com.Model.*;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderDAO extends DAO{
    public ArrayList<DeliveryOrder> getAllOrderOfDelivery(StaffDelivery staffDelivery) {
        try{
            //set data from tbl Order
            String sql = "select * from tblorder where tblStaffDeliverytblmemberID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, staffDelivery.getID());
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<DeliveryOrder> listDeliveryOrders = new ArrayList<>();
            while(resultSet.next()) {
                DeliveryOrder deliveryOrder = new DeliveryOrder();
                Integer costShip = resultSet.getInt("costShip");
                deliveryOrder.setID(resultSet.getInt("ID"));
                deliveryOrder.setStatusOrder(resultSet.getString("statusOrder"));
                deliveryOrder.setOrderDate(resultSet.getDate("orderDate"));
                deliveryOrder.setReceiveDate(resultSet.getDate("receiveDate"));
                deliveryOrder.setCostShip(resultSet.getInt("costShip"));
                Integer idPaymentOnline = resultSet.getInt("tblInforPaymentonlineID");
                if(idPaymentOnline != null) {
                    // set data from tbl Inforpayment online to Order
                    String aSql = "select * from tblInforPaymentonline where ID=?";
                    PreparedStatement preparedStatement1 = connection.prepareStatement(aSql);
                    preparedStatement1.setInt(1, idPaymentOnline);
                    ResultSet resultSet1 = preparedStatement1.executeQuery();
                    if(resultSet1.next()) {
                        InforPaymentonline inforPaymentonline = new InforPaymentonline(
                                resultSet1.getInt("ID"),
                                resultSet1.getString("numCard"),
                                resultSet1.getString("ownerNameCard"),
                                resultSet1.getDate("dateRelease"),
                                resultSet1.getString("typeCard"),
                                resultSet1.getInt("otp")
                        );
                        deliveryOrder.setInforPaymentonline(inforPaymentonline);
                    }
                }


                Integer idVoucher = resultSet.getInt("tblVoucherID");

                Integer rateDis = 0;

                if(idVoucher != null) {
                    // set data from tbl Voucher to Order
                    String bsql = "select * from tblVoucher where ID = ?";
                    PreparedStatement preparedStatement1 = connection.prepareStatement(bsql);
                    preparedStatement1.setInt(1, idVoucher);
                    ResultSet r = preparedStatement1.executeQuery();
                    if(r.next()) {
                        Voucher voucher = new Voucher(r.getInt("ID"),
                                r.getString("nameVoucher"),
                                r.getString("descriptions"),
                                r.getInt("discountRate"));
                        rateDis = r.getInt("discountRate");
                        deliveryOrder.setVoucher(voucher);

                    }
                }
                Integer idCustomer = resultSet.getInt("tblCustomertblmemberID");
                if(idCustomer != null) {
                    System.out.println("get Customer");
                    // set Data from tbl customer to Order
                    String csql = "select * from tblcustomer " +
                            "INNER JOIN tblmember ON tblmember.ID=tblcustomer.tblmemberID where tblmember.ID=?";
                    PreparedStatement preparedStatement1 = connection.prepareStatement(csql);
                    preparedStatement1.setInt(1, idCustomer);
                    ResultSet resultSet1 = preparedStatement1.executeQuery();
                    if(resultSet1.next()) {
                        Customer customer = new Customer(resultSet1.getString("username"),
                                resultSet1.getString("pass"),
                                resultSet1.getString("fullname"),
                                resultSet1.getString("address"),
                                resultSet1.getString("gender"),
                                resultSet1.getString("phonenumber"),
                                resultSet1.getInt("ID"),
                                resultSet1.getString("customerCode")
                                );
                        System.out.println(customer.getUsername() + " " + customer.getName());
                        deliveryOrder.setCustomer(customer);
                    }
                }

                Integer idOrder = resultSet.getInt("ID");
                // set data from tbl DetailInOrder to Order
                String dsql = "select * from tblDetailInOrder where tblOrderID=?";
                PreparedStatement preparedStatement1 = connection.prepareStatement(dsql);
                preparedStatement1.setInt(1, idOrder);
                ResultSet resultSet1 = preparedStatement1.executeQuery();
                ArrayList<DetailInCart> list = new ArrayList<>();
                Integer costTemp = 0;
                while(resultSet1.next()) {
                    DetailInCart detailInCart = new DetailInCart();
                    detailInCart.setUnitPrice(resultSet1.getInt("unitPrice"));
                    detailInCart.setQuanity(resultSet1.getInt("quanity"));
                    detailInCart.setID(resultSet1.getInt("ID"));

                    System.out.println("quanity " + resultSet1.getInt("quanity"));

                    Integer idProduct = resultSet1.getInt("tblProductID");
                    // set data from tblproduct to DetailInCart
                    String esql = "select * from tblproduct where ID=?";
                    PreparedStatement preparedStatement11 = connection.prepareStatement(esql);
                    preparedStatement11.setInt(1, idProduct);
                    ResultSet r1 = preparedStatement11.executeQuery();
                    Product product = new Product();
                    if(r1.next()) {
                        product.setID(r1.getInt("ID"));

                        product.setName(r1.getString("nameProduct"));
                        product.setCost(r1.getInt("cost"));
                        product.setDescription(r1.getString("descriptions"));
                        product.setImgPath(r1.getString("imgPath"));
                    }

                    System.out.println(product.getCost() );
                    costTemp += detailInCart.getUnitPrice() * detailInCart.getQuanity();


                    Integer idCategory = r1.getInt("tblCategoryProductID");
                    // set Data from tblCateforyProduct to Product
                    String fsql = "select * from tblCategoryProduct where ID=?";
                    PreparedStatement preparedStatement2 = connection.prepareStatement(fsql);
                    preparedStatement2.setInt(1, idCategory);
                    ResultSet resultSet12 = preparedStatement2.executeQuery();
                    if(resultSet12.next()) {
                        CategoryProduct categoryProduct = new CategoryProduct(
                                resultSet12.getString("nameCategory"),
                                resultSet12.getInt("ID")
                        );
                        product.setCategoryProduct(categoryProduct);
                    }

                    detailInCart.setProduct(product);
                    list.add(detailInCart);
                }
                Integer costTotal = costTemp - (int)(Double.valueOf(costTemp) * Double.valueOf(rateDis) / 100) + costShip;
                System.out.println(costTemp + " " + costTotal);
                deliveryOrder.setCostDiscount((int)(Double.valueOf(costTemp) * Double.valueOf(rateDis) / 100));
                deliveryOrder.setCostTemp(costTemp);
                deliveryOrder.setCostTotal(costTotal);

                deliveryOrder.setDetailInCart(list);
                listDeliveryOrders.add(deliveryOrder);
            }
            return listDeliveryOrders;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean UpdateOrder(DeliveryOrder deliveryOrder){
        try{
            connection.setAutoCommit(false);
            String sql = "update tblorder set statusOrder = ? where ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, deliveryOrder.getStatusOrder());
            preparedStatement.setInt(2, deliveryOrder.getID());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (Exception e) {
            return false;
        }

        return false;
    }
}
