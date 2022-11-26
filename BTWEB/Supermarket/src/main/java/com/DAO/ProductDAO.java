package com.DAO;

import com.Model.CategoryProduct;
import com.Model.Product;

import java.lang.reflect.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO extends DAO{
    public ProductDAO() {
        super();
    }
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        try{
            String sql = "SELECT tblproduct.ID, tblproduct.nameProduct, tblproduct.cost, tblproduct.descriptions, tblproduct.imgPath, tblCategoryProduct.nameCategory, tblCategoryProduct.ID\n" +
                    "                    FROM tblproduct\n" +
                    "                    INNER JOIN tblCategoryProduct ON tblproduct.tblCategoryProductID=tblCategoryProduct.ID\n";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                CategoryProduct categoryProduct = new CategoryProduct(resultSet.getString(6), resultSet.getInt(7));
                Product product = new Product(
                    resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        categoryProduct
                );
                list.add(product);
                System.out.println(list);

            }
            return list;
        } catch (Exception e) {
            return null;
        }
    }
}
