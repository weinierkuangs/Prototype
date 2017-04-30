<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
        <img src="AdminReport\crimson.png" alt="Crimson Video Store Logo" />
        <title>New Customer Registration</title>
    </head>
    <body>
        <hr>
        <h1>New Customer</h1>
        <html:html>
            <html:form action="/customerRegistration.jsp" method="get">
                Enter your First Name:
                <br><br>
                <html:text property="customerFirstName" value=""/>
                Enter your Last Name:
                <br><br>
                <html:text property="customerLastName" value=""/>
                Enter your Email:
                <br><br>
                <html:text property="customerEmail" value=""/>
                Enter your Password:
                <br><br>
                <html:text property="customerPassword" value=""/>
                <br><br>
                <html:submit>Register</html:submit>
            </html:form>
        </html:html>
        <br><br>
        <a href="customerLogin.jsp"><button>Go To Customer Login</button></a>
    </body>
</html:html>
