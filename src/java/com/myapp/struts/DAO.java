/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

/**
 *
 * @author jyu43
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {

    private Connection con;

    public int customerLoginValidation(String email, String password) throws Exception {

        int customer_id = 0;
        try {
            ResultSet rs = null;
            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "yujie-1276");
            PreparedStatement ps = con.prepareStatement("select * from customer where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                customer_id = rs.getInt("customer_id");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer_id;
    }

    public int adminLoginValidation(String email, String password) throws Exception {

        int staff_id = 0;
        try {
            ResultSet rs = null;
            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "yujie-1276");
            PreparedStatement ps = con.prepareStatement("select * from staff where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                staff_id = rs.getInt("staff_id");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return staff_id;
    }

    public void adminRegistration(String email, String password, String firstName, String lastName) throws Exception {

            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "yujie-1276");
                Statement st = con.createStatement();
                int value = st
                        .executeUpdate("INSERT INTO staff(First_name,Last_name,email,password,address_id,store_id,username)VALUES('"
                                + firstName
                                + "','"
                                + lastName
                                + "','"
                                + email
                                + "','"
                                + password + "',1,1,'username')");
            con.close();
    }
    public void customerRegistration(String email, String password, String firstName, String lastName) throws Exception {

            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "yujie-1276");
                Statement st = con.createStatement();
                int value = st
                        .executeUpdate("INSERT INTO customer(First_name,Last_name,email,password,address_id,store_id)VALUES('"
                                + firstName
                                + "','"
                                + lastName
                                + "','"
                                + email
                                + "','"
                                + password + "',1,1)");
            con.close();
    }
    public void customerAddWishList(String filmId, String customerId) throws Exception {

            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "yujie-1276");
                Statement st = con.createStatement();
                int value = st
                        .executeUpdate("INSERT INTO wish_list(customer_id,film_id)VALUES('"
                                + customerId
                                + "','"
                                + filmId + "')");
            con.close();
    }
    public void customerDeleteWishList(String wishListId) throws Exception {

            String URL = "jdbc:mysql://localhost:3306/sakila";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "yujie-1276");
                Statement st = con.createStatement();
                int value = st
                        .executeUpdate("delete from wish_list where wish_list_id = "
                                + wishListId);
            con.close();
    }
}
