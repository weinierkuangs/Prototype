<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html:html lang="true">
    <head>
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
        <title>Customer Search Page</title>
    </head>
    <body>

        Search:
        <html:form action="/customerSearch" method="get">
            <html:text style="display: none" property="filmId" size="10"/>
            Enter the Title to search:
            <html:text property="title" size="20"/><br><br>
            Enter the Category to search:
            <html:text property="category" size="10"/><br><br>
            Enter the Actor to search:
            <html:text property="actor" size="10"/><br><br>
            <html:submit>Search</html:submit>
                <br><br>
        </html:form>


        <a href="customerMain.jsp"><button>Go Back</button></a><br><br>



        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT film.film_id, film.title, category.name, actor.first_name, film.description
            from film
            inner join film_category on film.film_id = film_category.film_id
            inner join category on category.category_id = film_category.category_id
            inner join film_actor on film_actor.film_id = film.film_id
            inner join actor on actor.actor_id = film_actor.actor_id
            where category.`name` like '<%=session.getAttribute("cCategory")%>' 
            and actor.first_name like '<%=session.getAttribute("cActor")%>' 
            and film.film_id like '%' 
            and film.title like '<%=session.getAttribute("cTitle")%>' 
            group by film_id
            order by film.title asc
        </sql:query>
        <table border="0">
            <tr>
                <th style = "display:none;" >Film ID</th>
                <th>Title</th>
                <th>Category</th>
                <th>Actor</th>
                <th>Description</th>
                <th colspan=2>Add to</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td style = "display:none;" ><c:out value="${row.film_id}"/></td>
                    <td><c:out value="${row.title}"/></td>
                    <td><c:out value="${row.name}"/></td>
                    <td><c:out value="${row.first_name}"/></td>
                    <td><c:out value="${row.description}"/></td>
                    <td><html:form action="/addToWishList" method="get">
                            <html:text style = "display:none;" property="customerId" value = "${sessionScope.customerId}"/>
                            <html:text style = "display:none;" property="filmId" value = "${row.film_id}"/>
                            <html:submit>Wish List</html:submit>
                        </html:form></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html:html>
