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
        <title>Revenue</title>
    </head>
    <body>
        <h1>Revenue</h1>
        <a href="${pageContext.request.contextPath}/adminMain.jsp"><button>Go Back</button></a><br><br>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="yujie-1276" />
        <sql:query dataSource="${snapshot}" var="result">
            select YEAR(payment_date) as 'Year', MONTH(payment_date) as 'Month', SUM(amount) as 'Total_Revenue' from payment GROUP BY MONTH(payment_date),YEAR(payment_date) ORDER BY 'Year', 'Month'
        </sql:query>
        <table border="0">
            <tr>
                <th>Year</th>
                <th>Month</th>
                <th>Total Revenue ($)</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.Year}"/></td>   
                    <td><c:out value="${row.Month}"/></td>
                    <td><c:out value="${row.Total_Revenue}"/></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
