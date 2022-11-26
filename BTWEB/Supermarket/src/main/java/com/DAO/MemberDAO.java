package com.DAO;

import com.Model.Customer;
import com.Model.Member;
import com.Model.StaffDelivery;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Optional;

public class MemberDAO extends DAO{
    public MemberDAO(){
        super();
    }
    public boolean checkRegistration(Member member) {
        try{
            String sql = "SELECT username FROM tblmember where username=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, member.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                preparedStatement.close();
                return false;
            }
        }catch (Exception e) {
            return false;
        }
        return true;
    }

    public Object checkLogin(Member member) {
        try{
            String sql = "SELECT * from tblmember where username=? and pass=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, member.getUsername());
            preparedStatement.setString(2, member.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                member.setName(resultSet.getString("fullname"));
                member.setGender(resultSet.getString("gender"));
                member.setPassword(resultSet.getString("pass"));
                member.setAddress(resultSet.getString("address"));
                member.setPhonenumber(resultSet.getString("phonenumber"));
                member.setID(resultSet.getInt("ID"));
                System.out.println(member);
                preparedStatement.close();
                String sql2 = "SELECT * from tblcustomer where tblmemberID=?";
                PreparedStatement preparedStatement1 = connection.prepareStatement(sql2);
                preparedStatement1.setInt(1, member.getID());
                ResultSet resultSet1 = preparedStatement1.executeQuery();
                if(resultSet1 != null && resultSet1.next()) {
                    Customer customer = new Customer(
                            member.getUsername(), member.getPassword(),
                            member.getName(), member.getAddress(),
                            member.getGender(), member.getPhonenumber(),
                            member.getID(), resultSet1.getString("customerCode"));
                    return customer;
                } else {
                    StaffDelivery staffDelivery = new StaffDelivery(
                            member.getUsername(), member.getPassword(),
                            member.getName(), member.getAddress(),
                            member.getGender(), member.getPhonenumber(),
                            member.getID(), "delivery");
                    return staffDelivery;

                }
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
    public boolean registration(Member member) {
        try{
            connection.setAutoCommit(false);
            String insertMember = "INSERT INTO tblmember (username,pass,fullname,gender,phonenumber,address)" +
                    "VALUES (?, ?, ?, ?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertMember);
            preparedStatement.setString(1,
                    member.getUsername());
            preparedStatement.setString(2,
                    member.getPassword());
            preparedStatement.setString(3,
                    member.getName());
            preparedStatement.setString(4,
                    member.getGender());
            preparedStatement.setString(5,
                    member.getPhonenumber());
            preparedStatement.setString(6,
                    member.getAddress());
            preparedStatement.executeUpdate();
            preparedStatement.close();

            String getIdCustomer = "SELECT ID from tblmember where username=?";

            preparedStatement = connection.prepareStatement(getIdCustomer);
            preparedStatement.setString(1, member.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();
            String idRegistration = "";
            while (resultSet.next()) {
                idRegistration = resultSet.getString("ID");
            }
            String saveRegistration = "INSERT INTO " +
                    "tblcustomer(customerCode, tblmemberID) VALUES(?,?)";

            preparedStatement = connection.prepareStatement(saveRegistration);

            preparedStatement.setString(1, "KH" + idRegistration);
            preparedStatement.setInt(2, Integer.parseInt(idRegistration));
            preparedStatement.executeUpdate();


            connection.commit();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
