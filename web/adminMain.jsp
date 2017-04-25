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
        <title>Admin Main Page</title>
    </head>
    <body>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="yujie-1276"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from staff where staff_id = <%=session.getAttribute("staffId")%>
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <h1>Welcome back ${row.first_name} ${row.last_name}!</h1>
        </c:forEach>
           
        Reports:<br><br>
        <a href="AdminReport/customerInformation.jsp"><button>Customer Information</button></a><br><br>
        <a href="AdminReport/mostPopularCategories.jsp"><button>Most Popular Categories</button></a><br><br>
        <a href="AdminReport/revenue.jsp"><button>Revenue</button></a><br><br>
        <a href="AdminReport/checkouts.jsp"><button>Current Checkouts</button></a><br><br>
        <a href="AdminReport/inventory.jsp"><button>Inventory</button></a><br><br>

        <a href="adminSearch.jsp"><button>Search</button></a><br><br>


    </body>
</html>
