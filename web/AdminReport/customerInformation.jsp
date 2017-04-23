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
        <title>Customer Information (Active)</title>
    </head>
    <body>
        <h1>Customer Information (Active)</h1>
        <a href="${pageContext.request.contextPath}/adminMain.jsp"><button>Go Back</button></a><br><br>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="yujie-1276" />
        <sql:query dataSource="${snapshot}" var="result">
            SELECT c.first_name, c.last_name, c.email, a.phone, a.address, city.city, a.district, a.postal_code, country.country, c.store_id
            FROM customer as c
            JOIN address as a   
            ON c.address_id = a.address_id
            JOIN city as city
            ON a.city_id = city.city_id
            JOIN country as country
            ON city.country_id = country.country_id
            WHERE active is true
            GROUP BY c.store_id, c.last_name, c.customer_id
        </sql:query>
        <table border="1">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address Line</th>
                <th>City</th>
                <th>District</th>
                <th>Zip</th>                
                <th>Country</th>
                <th>Store</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <th><c:out value="${row.first_name}"/></th>   
                    <th><c:out value="${row.last_name}"/></th>
                    <th><c:out value="${row.email}"/></th>
                    <th><c:out value="${row.phone}"/></th>
                    <th><c:out value="${row.address}"/></th>
                    <th><c:out value="${row.city}"/></th>
                    <th><c:out value="${row.district}"/></th>
                    <th><c:out value="${row.postal_code}"/></th>
                    <th><c:out value="${row.country}"/></th>
                    <th><c:out value="${row.store_id}"/></th>
                </tr>
            </c:forEach>
        </table>    


    </body>
</html>
