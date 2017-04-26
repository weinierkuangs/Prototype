<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Customer Registration</title>
    </head>
    <body>
        New Customer <br><br>
        <html:html>
            <html:form action="/customerRegistration.jsp" method="get">
                Enter your First Name:
                <html:text property="customerFirstName" value=""/><br><br>
                Enter your Last Name:
                <html:text property="customerLastName" value=""/><br><br>
                Enter your Email:
                <html:text property="customerEmail" value=""/><br><br>
                Enter your Password:
                <html:text property="customerPassword" value=""/><br><br>
                
                <html:submit>Register</html:submit>
                    <br><br>
            </html:form>
        </html:html>
        <a href="customerLogin.jsp"><button>Go To Customer Login</button></a>

    </body>
</html:html>
