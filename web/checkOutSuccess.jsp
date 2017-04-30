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
        <title>Success!</title>
    </head>
    <body>
        <hr>
        <h1>You have Successfully Checked Out Your Cart!</h1>

        Movies Checked Out:

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>

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
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td style="display: none"><c:out value="${row.check_out_id}"/></td>
                    <td><c:out value="${row.title}"/></td>
                </tr>
            </c:forEach>
        </table>


        <a href="customerMain.jsp"><button>Go Back</button></a><br><br>
    </body>
</html>
