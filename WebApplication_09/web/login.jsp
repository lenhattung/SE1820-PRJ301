<%-- 
    Document   : login
    Created on : Feb 13, 2025, 10:43:40 AM
    Author     : tungi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login" />
                UserID <input type="text" name="txtUserID"/><br/>
                Password <input type="password" name="txtPassword"/><br/>
                <input type="submit" value="Login"/>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
