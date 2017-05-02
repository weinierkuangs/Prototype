<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
        <title>New Staff Registration</title>
    </head>
    <body>
        <div id="navbar">
            <a href="customerMain.jsp">
                <img src="AdminReport\crimson.png" alt="Crimson Video Store Logo" />
            </a>
        </div>
        <hr align="left" width="90%">
        <h1>New Staff</h1>
        <br></br>
        <html:html>
            <html:form action="/adminRegistration.jsp" method="get">
                <strong><bean:write name="form" property="errorName" filter="false"/></strong>
                Enter your First Name:
                <br></br>
                <html:text property="adminFirstName" value=""/><br><br>
                <strong><bean:write name="form" property="errorName" filter="false"/></strong>
                Enter your Last Name:
                <br></br>
                <html:text property="adminLastName" value=""/><br><br>
                <strong><bean:write name="form" property="errorEmail" filter="false"/></strong>
                Enter your Email:
                <br></br>
                <html:text property="adminEmail" value=""/><br><br>
                <strong><bean:write name="form" property="errorPassword" filter="false"/></strong>
                Enter your Password:
                <br></br>
                <html:text property="adminPassword" value=""/><br><br>
                <html:submit>Register</html:submit>
            </html:form>
        </html:html>
        <br></br>
        <a href="adminLogin.jsp"><button>Go To Admin Login</button></a>
    </body>
</html:html>
