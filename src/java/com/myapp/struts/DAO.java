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
            Statement st = con.createStatement();
            int value = st
                    .executeUpdate("TRUNCATE TABLE check_out");
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

    public void deleteCheckOut(String checkOutId) throws Exception {

        String URL = "jdbc:mysql://localhost:3306/sakila";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, "root", "yujie-1276");
        Statement st = con.createStatement();
        int value = st
                .executeUpdate("delete from check_out where check_out_id = "
                        + checkOutId);
        con.close();
    }

    public int addToCheckOut(String filmId, String customerId) throws Exception {

        int inventory_id = 0;
        ResultSet rs = null;
        String URL = "jdbc:mysql://localhost:3306/sakila";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, "root", "yujie-1276");
        PreparedStatement ps = con.prepareStatement("select *\n"
                + "from(\n"
                + "SELECT distinct rental.inventory_id, \n"
                + "CASE WHEN MAX(CASE WHEN return_date IS NULL THEN 1 ELSE 0 END) = 0\n"
                + "THEN MAX(return_date) \n"
                + "END as return_date\n"
                + "FROM rental\n"
                + "join inventory on inventory.inventory_id=rental.inventory_id\n"
                + "join film on film.film_id=inventory.film_id\n"
                + "where film.film_id = ? group by rental.inventory_id) as inventoryAva\n"
                + "where inventoryAva.return_date is not null");
        ps.setString(1, filmId);
        rs = ps.executeQuery();
        if (rs.next()) {
            inventory_id = rs.getInt("inventory_id");
            Statement st = con.createStatement();
            int value = st
                    .executeUpdate("INSERT INTO check_out(inventory_id, customer_id, staff_id)VALUES('"
                            + inventory_id
                            + "','"
                            + customerId + "',1)");
        }
        con.close();
        return inventory_id;
    }

    public int checkOutValidation(String filmId, String customerId) throws Exception {

        int error = 0; //Error Code: Same movie in cart=1; More than 5 movies in cart =2; More than 5 movies not returned=3
        ResultSet rs = null;
        String URL = "jdbc:mysql://localhost:3306/sakila";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, "root", "yujie-1276");
        PreparedStatement ps = con.prepareStatement("select count(*)\n"
                + "from rental\n"
                + "where return_date is null and customer_id = " + customerId);
        rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getInt("count(*)") >= 5) {
                error = 3;
            }
        }
        ResultSet rs1 = null;
        PreparedStatement ps1 = con.prepareStatement("select count(*) from check_out");
        rs1 = ps1.executeQuery();
        if (rs1.next()) {
            if (rs1.getInt("count(*)") >= 5) {
                error = 2;
            }
        }
        ResultSet rs2 = null;
        PreparedStatement ps2 = con.prepareStatement("select count(*) from check_out \n"
                + "join inventory on inventory.inventory_id = check_out.inventory_id\n"
                + "where film_id = " + filmId);
        rs2 = ps2.executeQuery();
        if (rs2.next()) {
            if (rs2.getInt("count(*)") >= 1) {
                error = 1;
            }
        }

        con.close();
        return error;
    }

    public void checkOut() throws Exception {

        String URL = "jdbc:mysql://localhost:3306/sakila";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, "root", "yujie-1276");
        Statement st = con.createStatement();
        int value = st
                .executeUpdate("insert rental (rental.inventory_id, customer_id,staff_id) \n"
                        + "select check_out.inventory_id,check_out.customer_id,check_out.staff_id from check_out\n"
                        + "");
        con.close();
    }

    public void returnMovie(String rentalId) throws Exception {

        String URL = "jdbc:mysql://localhost:3306/sakila";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, "root", "yujie-1276");
        Statement st = con.createStatement();
        int value = st
                .executeUpdate("update rental set return_date = NOW() where rental_id =" + rentalId);
        con.close();
    }
    public void newStore(String staffId) throws Exception {

        String URL = "jdbc:mysql://localhost:3306/sakila";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, "root", "yujie-1276");
        Statement st = con.createStatement();
        int value = st
                .executeUpdate("");
        con.close();
    }
}
