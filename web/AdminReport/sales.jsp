<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <title>Sales</title>
    </head>
    <body>
        <div id="navbar">
           <a href="${pageContext.request.contextPath}/adminMain.jsp">
             <img src="crimson.png" alt="Crimson Video Store Logo" />
            </a>
        </div>
        <hr>
        <h1>Sales</h1>
        <a href="${pageContext.request.contextPath}/adminMain.jsp"><button>Go Back</button></a><br><br>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="yujie-1276" />
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * FROM sales_by_film_category LIMIT 1000;
        </sql:query>
        <table border="0">
            <tr>
                <th>Category</th>
                <th>Total Sales ($)</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.category}"/></td>
                    <td><c:out value="${row.total_sales}"/></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
