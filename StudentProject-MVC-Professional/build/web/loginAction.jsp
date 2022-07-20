<%-- 
    Document   : loginAction
    Created on : Feb 9, 2017, 4:01:21 PM
    Author     : BINI
--%>


<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Admin"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.AdminDAO"%>  <%-- Step 1: import package  business() class--%>

<%

Admin admin=new Admin();// Step 2 : Create object of the class


String uname=request.getParameter("uname");
String pass=request.getParameter("pass");

System.out.println("username======action page========"+uname);
System.out.println("password======action page========"+pass);

admin.setUsername(uname); //Step 3: setting values from jsp to setter/getter class
admin.setPassword(pass);//Step 3: setting values from jsp to setter/getter class

boolean flag=AdminDAO.getLogin(admin); //Step 5: calling getLogin() from business class using setter/getter class for getting getter values

// You need to pass the object of the getter/setter class eg: psgs from here. Otherwise you
//need to create an object of setter/getter class in the business class. In that case default construtor
// of the getter/setter class will invoke and assign '\000\' values to private variables. We need
//already set values , not the null value. so you must pass object of the getter/setter class from 
//here.

if(flag){
    session.setAttribute("username", uname);
    response.sendRedirect("admin/AHome.jsp");
    //out.println("succss-admin");
    
}
else{
    response.sendRedirect("index.jsp?v=1");
} 

%>

