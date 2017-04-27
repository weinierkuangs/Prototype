<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html:html lang="true">
    <head>
        <title>Admin Search Page</title>
    </head>
    <body>

        Search:
        <html:form action="/adminSearch" method="get">
            Enter the Film ID to search:
            <html:text property="filmId" size="10"/><br><br>
            Enter the Title to search:
            <html:text property="title" size="20"/><br><br>
            Enter the Category to search:
            <html:text property="category" size="10"/><br><br>
            Enter the Actor to search:
            <html:text property="actor" size="10"/><br><br>
            <html:submit>Search</html:submit>
                <br><br>
        </html:form>

        <a href="adminMain.jsp"><button>Go Back</button></a><br><br>


        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="yujie-1276"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT film.film_id, film.title, category.name, actor.first_name, film.description
            from film
            inner join film_category on film.film_id = film_category.film_id
            inner join category on category.category_id = film_category.category_id
            inner join film_actor on film_actor.film_id = film.film_id
            inner join actor on actor.actor_id = film_actor.actor_id
            where category.`name` like '<%=session.getAttribute("category")%>' 
            and actor.first_name like '<%=session.getAttribute("actor")%>' 
            and film.film_id like '<%=session.getAttribute("filmId")%>' 
            and film.title like '<%=session.getAttribute("title")%>' 
            group by film_id
            order by film.title asc
        </sql:query>
        <table border="1" width="100%">
            <tr>
                <th>Film ID</th>
                <th>Title</th>
                <th>Category</th>
                <th>Actor</th>
                <th>Description</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.film_id}"/></td>
                    <td><c:out value="${row.title}"/></td>
                    <td><c:out value="${row.name}"/></td>
                    <td><c:out value="${row.first_name}"/></td>
                    <td><c:out value="${row.description}"/></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html:html>
