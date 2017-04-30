<%-- 
    Document   : adminMain
    Created on : Apr 23, 2017, 1:21:03 AM
    Author     : jyu43
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
        <img src="AdminReport\crimson.png" alt="Crimson Video Store Logo" />
        <title>Admin Main Page</title>
    </head>
    <body>
        <hr>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from staff where staff_id = <%=session.getAttribute("staffId")%>
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <h1>Welcome back ${row.first_name} ${row.last_name}!</h1>
        </c:forEach>
            <br></br>
            <h2>Reports:</h2>
        <a href="AdminReport/customerInformation.jsp"><button>Customer Information</button></a><br><br>
        <a href="AdminReport/mostPopularCategories.jsp"><button>Most Popular Categories</button></a><br><br>
        <a href="AdminReport/revenue.jsp"><button>Revenue</button></a><br><br>
        <a href="AdminReport/checkouts.jsp"><button>Current Checkouts</button></a><br><br>
        <a href="AdminReport/inventory.jsp"><button>Inventory</button></a><br><br>

        <a href="adminSearch.jsp"><button>Search</button></a><br><br>
        
        <a href="adminLogin.jsp"><button>Log Out</button></a><br><br>


    </body>
</html>
