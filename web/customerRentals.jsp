<%-- 
    Document   : customerMain
    Created on : Apr 23, 2017, 1:21:03 AM
    Author     : jyu43
--%>

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
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
            <title>Your Rentals</title>
        </head>
        <body>
            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost:3306/sakila"
                               user="root"  password="yujie-1276"/>
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from customer where customer_id = <%=session.getAttribute("customerId")%>
            </sql:query>
            <c:forEach var="row" items="${result.rows}">
                <h1>Welcome back ${row.first_name} ${row.last_name}!</h1>
            </c:forEach>

            <a href="customerMain.jsp"><button>Go Back</button></a><br><br>
            <sql:query dataSource="${snapshot}" var="result">
                select rental.rental_id, inventory.inventory_id,film.title,film.rental_duration,rental.rental_date,rental.return_date,film.rental_rate,
                DATEDIFF(return_date,rental_date) as diff, 
                rental_rate*DATEDIFF(return_date,rental_date) as normal_fee,
                case when DATEDIFF(return_date,rental_date)<=rental_duration then 0 else DATEDIFF(return_date,rental_date)- rental_duration end *0.2*rental_rate as penalties
                from rental
                join inventory on inventory.inventory_id=rental.inventory_id
                join film on film.film_id=inventory.film_id
                where rental.customer_id = <%=session.getAttribute("customerId")%>
            </sql:query>
            <table border="0">
                <tr>
                    <th>Rental ID</th>
                    <th>Stock ID</th>
                    <th>Title</th>
                    <th>Rental Time</th>
                    <th>Return Time</th>
                    <th>Rental Rate</th>
                    <th>Maximum Days Allowed</th>
                    <th>Days Rented</th>
                    <th>Normal Fee</th>
                    <th>Penalties</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.rental_id}"/></td>
                        <td><c:out value="${row.inventory_id}"/></td>
                        <td><c:out value="${row.title}"/></td>
                        <td><c:out value="${row.rental_date}"/></td>
                        <td><c:out value="${row.return_date}"/></td>
                        <td><c:out value="${row.rental_rate}"/></td>
                        <td><c:out value="${row.rental_duration}"/></td>
                        <td><c:out value="${row.diff}"/></td>
                        <td><c:out value="${row.normal_fee}"/></td>
                        <td><c:out value="${row.penalties}"/></td>
                        <td><html:form action="/returnMovie" method="get">
                                <html:text style = "display:none;" property="rentalId" size="10" value = "${row.rental_id}"/>
                                <html:submit>Return This Movie</html:submit>
                            </html:form></td>
                    </tr>
                </c:forEach>
            </table>
            <br><br>
            <sql:query dataSource="${snapshot}" var="result">
                select sum(rental_rate*DATEDIFF(return_date,rental_date) +
                case when DATEDIFF(return_date,rental_date)<=rental_duration then 0 else DATEDIFF(return_date,rental_date)- rental_duration end *0.2*rental_rate) as Total
                from rental
                join inventory on inventory.inventory_id=rental.inventory_id
                join film on film.film_id=inventory.film_id
                where rental.customer_id = <%=session.getAttribute("customerId")%>
            </sql:query>
            <table border="0">
                <tr>
                    <th>Total Due</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.Total}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="payment.jsp"><button>Pay Now</button></a><br><br>
        </body>
    </html>
