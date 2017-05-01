<%-- 
    Document   : matchCaptcha
    Created on : Apr 29, 2017, 1:57:24 AM
    Author     : jyu43
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <title>Math Captcha</title>
    </head>
    <body>
        <h1>Are you a robot?</h1>
        <hr>
        <h3><bean:write name="form" property="errorCaptcha" filter="false"/></h3>
        <h2>
        <%! int num_x = (int) (Math.random() * 10);
            int num_y = (int) (Math.random() * 10);
            int num_a = num_x + num_y;
            String a = String.valueOf(num_a);%>
        <%=num_x%> + <%=num_y%> = ?
        </h2>
        <html:html>
            <html:form action="/captchaCustomer.jsp" method="get">
                <html:text style="display:none" property="captcha" value="<%=a%>"/>
                Enter your Answer:
                <br></br>
                <html:text property="answer" value=""/><br><br>
                <html:submit>Submit</html:submit>
                    <br><br>
            </html:form>
        </html:html>


    </body>
</html>