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
        <title>Most Popular Categories</title>
    </head>
    <body>
        <h1>Most Popular Categories</h1>
        <a href="${pageContext.request.contextPath}/adminMain.jsp"><button>Go Back</button></a><br><br>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="yujie-1276" />
        <sql:query dataSource="${snapshot}" var="result">
            SELECT c.name, count(distinct r.rental_id) as 'Number_Rents'
            FROM inventory as i
                JOIN film as f
                    ON i.film_id = f.film_id
                JOIN rental as r
                    ON r.inventory_id = i.inventory_id
                JOIN film_category as fc
                    ON fc.film_id = f.film_id
                JOIN category as c
                    ON fc.category_id = c.category_id
            WHERE r.return_date IS NOT NULL
            GROUP BY c.name
            ORDER BY count(distinct r.rental_id) DESC
        </sql:query>
        <table border="1">
            <tr>
                <th>Category</th>
                <th>Total Rentals to Date</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <th><c:out value="${row.name}"/></th>   
                    <th><c:out value="${row.Number_Rents}"/></th>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
