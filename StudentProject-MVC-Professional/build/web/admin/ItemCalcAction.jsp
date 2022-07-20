<%-- 
    Document   : ItemCalcAction
    Created on : 18 Jul, 2017, 4:46:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String item=request.getParameter("item");
            
            float quantity=Float.parseFloat(request.getParameter("quantity"));
            
            float price;
        
        
        %>
    </body>
</html>
