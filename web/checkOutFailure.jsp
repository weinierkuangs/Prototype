<%-- 
    Document   : customerMain
    Created on : Apr 23, 2017, 1:21:03 AM
    Author     : jyu43
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
        <title>Error</title>
    </head>
    <body>
        <h1>
            Errors:<br><br>
        </h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="yujie-1276"/>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from error_msg where error_id = <%=session.getAttribute("errorId")%>
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <h1>${row.error_msg}</h1>
        </c:forEach>
    </body>
</html>
