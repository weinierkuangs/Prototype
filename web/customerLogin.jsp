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
        <title>Customer Login</title>
    </head>
    <body>
        <div>
            <hr>
            <h1>Customer Login</h1>
            <br><br>
        <html:html>
            <html:form action="/customerLogin" method="get">
                Enter your Email Address:
                <br></br>
                <html:text property="customerEmail" value=""/><br><br>
                Enter your Password:
                <br></br>
                <html:text property="customerPassword" value=""/><br><br>
                <html:submit>Login</html:submit>
            </html:form>
        </html:html>
        <br><br>
        <a href="CAPTCHA/mathCaptchaCustomer.jsp"><button>Register</button></a><br><br>
        <a href="adminLogin.jsp"><button>Go To Admin Login</button></a>
        </div>
    </body>
</html:html>
