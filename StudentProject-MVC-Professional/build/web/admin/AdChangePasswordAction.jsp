<%-- 
    Document   : bill Action
    Created on : August 24, 2017, 4:01:21 PM
    Author     : BINI
--%>


<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Admin"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.AdminDAO"%>  <%-- Step 1: import package  business() class--%>

<%

Admin admin=new Admin();// Step 2 : Create object of the class


String npwd=request.getParameter("npwd");
System.out.println("new pass==================="+npwd);




admin.setPassword(npwd);


boolean check_flag=AdminDAO.updatePassword(admin); 




if(check_flag){
   
   // response.sendRedirect("AdChangePassword.jsp?v=4"); 
   response.sendRedirect("../PasswordChanged.jsp?v=0");
}
else{
         response.sendRedirect("AdChangePassword.jsp?v=3");  
  
}



%>

