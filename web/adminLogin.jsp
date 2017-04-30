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
        <title>Admin Login</title>
    </head>
    <body>
        <hr>
        <h1>Admin Login</h1>
        <br><br>
        <html:html>
            <html:form action="/adminLogin.jsp" method="get">
                Enter your Email Address:
                <br><br>
                <html:text property="adminEmail" value=""/><br><br>
                Enter your Password:
                <br><br>
                <html:text property="adminPassword" value=""/><br><br>
                <html:submit>Login</html:submit>
            </html:form>
        </html:html>
        <br><br>
        <a href="CAPTCHA/mathCaptcha.jsp"><button>Register</button></a><br><br>
        <a href="customerLogin.jsp"><button>Go To Customer Login</button></a>
    </body>
</html:html>
