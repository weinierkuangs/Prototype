<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">       
        <title>Check Out Cart</title>
    </head>
    <body>
        <div id="navbar">
            <a href="customerMain.jsp">
                <img src="AdminReport\crimson.png" alt="Crimson Video Store Logo" />
            </a>
        </div>
        <hr>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from customer where customer_id = <%=session.getAttribute("customerId")%>
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <h1>Welcome back, ${row.first_name} ${row.last_name}!</h1>
        </c:forEach>
        <h1>Your Cart</h1>
        <a href="customerMain.jsp"><button>Go Back</button></a><br><br>
        <a href="customerSearch.jsp"><button>Search</button></a><br><br>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>

        <sql:query dataSource="${snapshot}" var="result">
            Select check_out.check_out_id, film.title
            from check_out
            join inventory on check_out.inventory_id = inventory.inventory_id
            join film on film.film_id = inventory.film_id

        </sql:query>
        <table border="0">
            <tr>
                <th style="display: none">check_out_id</th>
                <th>Title</th>
                <th>Action</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td style="display: none"><c:out value="${row.check_out_id}"/></td>
                    <td><c:out value="${row.title}"/></td>
                    <td><html:form action="/deleteCheckOutCart" method="get">
                            <html:text style = "display:none;" property="checkOutId" size="10" value = "${row.check_out_id}"/>
                            <html:submit>Delete</html:submit>
                        </html:form></td>
                </tr>
            </c:forEach>
        </table>
        <br><br>
        <html:form action="/checkOut" method="get">
            <html:submit>Check Out All</html:submit>
        </html:form><br><br>
    </body>    
    <footer>
        <div id="foot">
            <hr>
            <p>
                Contact us at ✆ <a href="tel:205-348-0538">(205)348-0538</a> or ✉ <a href="mailto:videostore@crimson.ua.edu">videostore@crimson.ua.edu</a>.
                <br><br>
                <u>Spring 2017 Stores Hours:</u> 
                <br>
                Monday-Thursday 12:00PM-8:00PM
                <br>                
                Friday-Sunday 10AM-10:00PM
                <br><br>
                While using this site, you agree to have read and accepted our terms of use, cookie and privacy policy. 
                <br>
                Copyright © 2003-2017 Crimson Video Store. All Rights Reserved. Powered by Crimson Video Store.
            </p>
        </div>
    </footer>
</html>
