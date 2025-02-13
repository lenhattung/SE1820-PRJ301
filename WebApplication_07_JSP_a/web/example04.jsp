<%-- 
    Document   : example04
    Created on : Feb 10, 2025, 10:31:49 AM
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
        <% for(int i=2; i<=9; i++){ 
            %>
            <hr/>
            <h3>CỬU CHƯƠNG <%=i%></h3>
            <%
                for(int j=1; j<=10; j++){
                    %>
                    <%=i%> * <%=j%> = <%=(i*j)%><br/>
                    <%
                }
            %>
            <%
        }%>
    </body>
</html>
