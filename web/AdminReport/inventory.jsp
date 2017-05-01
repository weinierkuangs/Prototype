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
        <title>Inventory</title>
    </head>
    <body>
        <div id="navbar">
           <a href="${pageContext.request.contextPath}/adminMain.jsp">
             <img src="crimson.png" alt="Crimson Video Store Logo" />
            </a>
        </div>
        <hr>
        <h1>Current Store Inventory</h1>
        <a href="${pageContext.request.contextPath}/adminMain.jsp"><button>Go Back</button></a><br><br>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="yujie-1276" />
        <sql:query dataSource="${snapshot}" var="result">
            SELECT f.title, count(distinct i.inventory_id) as 'Total_Inventory', count(distinct r.rental_id) as 'Number_Rents'
            FROM inventory as i
            JOIN film as f
            ON i.film_id = f.film_id
            JOIN rental as r
            ON r.inventory_id = i.inventory_id
            WHERE r.return_date IS NOT NULL
            GROUP BY f.film_id, f.title
        </sql:query>
        <table border="0">
            <tr>
                <th>Film Title</th>
                <th>Total Inventory</th>
                <th>Number of Rents to Date</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.title}"/></td>   
                    <td><c:out value="${row.Total_Inventory}"/></td>
                    <td><c:out value="${row.Number_Rents}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
