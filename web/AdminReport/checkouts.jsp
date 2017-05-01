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
        <img src="AdminReport\crimson.png" alt="Crimson Video Store Logo" />
        <title>Current Store Checkouts (both stores)</title>
    </head>
    <body>
        <h1>Current Store Checkouts (both stores)</h1>
        <a href="${pageContext.request.contextPath}/adminMain.jsp"><button>Go Back</button></a><br><br>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="yujie-1276" />
        <sql:query dataSource="${snapshot}" var="result">
            SELECT f.title, c.first_name, c.last_name, c.email, f.rental_rate, f.replacement_cost, i.store_id 
            FROM rental as r
            JOIN customer as c
            ON c.customer_id = r.customer_id
            JOIN inventory as i
            ON r.inventory_id = i.inventory_id
            JOIN film as f
            ON i.film_id = f.film_id
            WHERE return_date IS NULL 
            GROUP BY i.store_id, c.last_name, f.title, c.first_name, c.email, f.rental_rate, f.replacement_cost
        </sql:query>
        <table border="0">
            <tr>
                <th>Film Title</th>
                <th>Customer First Name</th>
                <th>Customer Last Name</th>
                <th>Customer Email</th>
                <th>Rental Rate ($)</th>
                <th>Replacement Cost ($)</th>
                <th>Store</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.title}"/></td>   
                    <td><c:out value="${row.first_name}"/></td>
                    <td><c:out value="${row.last_name}"/></td>
                    <td><c:out value="${row.email}"/></td>
                    <td><c:out value="${row.rental_rate}"/></td>
                    <td><c:out value="${row.replacement_cost}"/></td>
                    <td><c:out value="${row.store_id}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
