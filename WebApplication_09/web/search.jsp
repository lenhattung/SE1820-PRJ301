<%-- 
    Document   : search
    Created on : Feb 13, 2025, 11:27:20 AM
    Author     : tungi
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
        <%
            UserDTO user = (UserDTO)request.getAttribute("user");
        %>
        <h1> Welcome <%=user.getFullName()%> </h1>
        
        <form action="#">
            Search Value: <input type="submit" name="txtSearchValue"/><br/>
            <input type="submit" name="Search"/>
        </form> <h1>Hello World!</h1>
    </body>
</html>
