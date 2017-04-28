<%-- 
    Document   : wishList
    Created on : Apr 26, 2017, 12:01:44 AM
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
        <title>Wish List</title>
    </head>
    <body>
        <h1>Your Wish List</h1>
        <a href="customerMain.jsp"><button>Go Back</button></a><br><br>
        <a href="customerSearch.jsp"><button>Search</button></a><br><br>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="yujie-1276"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT film.film_id,wish_list.wish_list_id, film.title, wish_list.last_update as 'Time Added'FROM wish_list
            join film on film.film_id = wish_list.film_id
            where customer_id = <%=session.getAttribute("customerId")%>

        </sql:query>
        <table border="0">
            <tr>
                <th style="display: none">film_id</th>
                <th style="display: none">wish_list_id</th>
                <th>Title</th>
                <th>Time Added</th>
                <th colspan=2>Action</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td style="display: none"><c:out value="${row.film_id}"/></td>
                    <td style="display: none"><c:out value="${row.wish_list_id}"/></td>
                    <td><c:out value="${row.title}"/></td>
                    <td><c:out value="${row.last_update}"/></td>
                    <td><html:form action="/deleteWishList" method="get">
                            <html:text style = "display:none;" property="wishListId" size="10" value = "${row.wish_list_id}"/>
                            <html:submit>Delete</html:submit>
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
