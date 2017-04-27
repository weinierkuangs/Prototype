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
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from customer where customer_id = <%=session.getAttribute("customerId")%>
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <h1>Welcome back ${row.first_name} ${row.last_name}!</h1>
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
                <th >Action</th>
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


        <html:form action="/checkOut" method="get">
            <html:submit>Check Out All</html:submit>
        </html:form><br><br>
    </body>

</html>
