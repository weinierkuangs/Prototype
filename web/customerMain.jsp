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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
        <img src="AdminReport\crimson.png" alt="Crimson Video Store Logo" />
        <title>Customer Main Page</title>
    </head>
    <body>
        <hr>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from customer where customer_id = <%=session.getAttribute("customerId")%>
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <h1>Welcome back ${row.first_name} ${row.last_name}!</h1>
        </c:forEach>

        <a href="wishList.jsp"><button>Wishlist</button></a>
        <a href="customerRentals.jsp"><button>Your Rental History</button></a>
        <a href="checkOut.jsp"><button>Check Out Cart</button></a><br><br>


        <a href="customerSearch.jsp"><button>Search</button></a><br><br>
        <a href="customerLogin.jsp"><button>Log Out</button></a><br><br>

        
        <h1>Current Films to Rent</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT DISTINCT film.film_id as 'film_id', film.title as 'title', 
            language.name as 'language', LEFT(film.release_year, 4) as 'release_year', 
            film.description as 'description'
            FROM film
            join language on language.language_id = film.language_id
        </sql:query>
        <table border="0">
            <tr>
                <th style="display: none">film_id</th>
                <th>Title</th>
                <th>Language</th>
                <th>Year</th>
                <th>Description</th>
                <th colspan=2>Add to</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td style="display: none"><c:out value="${row.film_id}"/></td>
                    <td><c:out value="${row.title}"/></td>
                    <td><c:out value="${row.name}"/></td>
                    <td><c:out value="${row.release_year}"/></td>
                    <td><c:out value="${row.description}"/></td>
                    <td><html:form action="/addToWishList" method="get">
                            <html:text style = "display:none;" property="customerId" size="10" value = "${sessionScope.customerId}"/>
                            <html:text style = "display:none;" property="filmId" size="10" value = "${row.film_id}"/>
                            <html:submit>Wish List</html:submit>
                        </html:form></td>
                    <td><html:form action="/addToCheckOut" method="get">
                            <html:text style = "display:none;" property="customerId" size="10" value = "${sessionScope.customerId}"/>
                            <html:text style = "display:none;" property="filmId" size="10" value = "${row.film_id}"/>
                            <html:submit>Check Out Cart</html:submit>
                        </html:form></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
