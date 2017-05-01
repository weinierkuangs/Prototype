<%-- 
    Document   : payment
    Created on : Apr 28, 2017, 12:33:14 AM
    Author     : jyu43
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="AdminReport\stylesheet.css">
        <title>Payment</title>
    </head>
    <body>
        <div id="navbar">
            <a href="customerMain.jsp">
                <img src="AdminReport\crimson.png" alt="Crimson Video Store Logo" />
            </a>
        </div>
        <hr>
        <h1>Payment</h1>
        <html:form action="/pay">
            <table border="0">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <bean:write name="form" property="errorName" filter="false"/>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>Enter your name:</td>
                        <td><html:text property="name" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <bean:write name="form" property="errorNumber" filter="false"/>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>Enter your card number:</td>
                        <td><html:text property="number" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <bean:write name="form" property="errorYear" filter="false"/>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>Enter your card's expiration year:</td>
                        <td><html:text property="year" /></td>
                    </tr>
                    <tr>
                        <td>Enter your card's expiration month:</td>
                        <td><html:text property="month" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><html:submit value="Submit" /></td>
                    </tr>
                </tbody>
            </table>
        </html:form>
        <br></br>
            <a href="customerRentals.jsp"><button>Go Back</button></a><br><br>
    </body>
</html>
