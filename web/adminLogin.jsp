<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
        <title>Admin Login</title>
    </head>
    <body>
        <div id="navbar">
            <a href="adminLogin.jsp">
                <img src="AdminReport\crimson.png" alt="Crimson Video Store Logo" />
            </a>
        </div>
        <hr align="left" width="90%">
        <h1>Admin Login</h1>
        <br>
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
    <footer>
        <div id="foot">
            <hr align="left" width="90%">
            <p>
                Contact us at ✆ <a href="tel:205-348-0538">(205)348-0538</a> or ✉ <a href="mailto:videostore@crimson.ua.edu">videostore@crimson.ua.edu</a>.
                <br><br>
                <u>Spring 2017 Stores Hours:</u> 
                <br>
                Monday-Thursday 12:00PM-8:00PM
                <br>                
                Friday-Sunday 10AM-10:00PM
                <br><br>
                While using this site, you agree to have read and accepted our terms of use, cookie and privacy policy. 
                <br>
                Copyright © 2003-2017 Crimson Video Store. All Rights Reserved. Powered by Crimson Video Store.
            </p>
        </div>
    </footer>
</html:html>
