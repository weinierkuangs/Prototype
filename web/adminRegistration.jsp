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
        New Staff: <br><br>
        <html:html>
            <html:form action="/adminRegistration.jsp" method="get">
                <bean:write name="form" property="errorName" filter="false"/><br><br>
                Enter your First Name:
                <html:text property="adminFirstName" value=""/><br><br>
                <bean:write name="form" property="errorName" filter="false"/><br><br>
                Enter your Last Name:
                <html:text property="adminLastName" value=""/><br><br>
                <bean:write name="form" property="errorEmail" filter="false"/><br><br>
                Enter your Email:
                <html:text property="adminEmail" value=""/><br><br>
                <bean:write name="form" property="errorPassword" filter="false"/><br><br>
                Enter your Password:
                <html:text property="adminPassword" value=""/><br><br>

                <html:submit>Register</html:submit>
                    <br><br>
            </html:form>
        </html:html>
        <a href="customerLogin.jsp"><button>Go To Admin Login</button></a>

    </body>
</html:html>
