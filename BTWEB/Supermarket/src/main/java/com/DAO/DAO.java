package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
    protected static Connection connection;
    public DAO() {
        if(DAO.connection == null) {
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                String MYSQL_URL = "jdbc:mysql://localhost:3306/pttk?autoReconnect=true&useSSL=false";
                String MYSQL_USERNAME = "root";
                String MYSQL_PASSWORD = "123456789";
                DAO.connection = DriverManager.getConnection(MYSQL_URL, MYSQL_USERNAME, MYSQL_PASSWORD);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
