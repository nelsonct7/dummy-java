<%-- 
    Document   : bill Action
    Created on : August 24, 2017, 4:01:21 PM
    Author     : BINI
--%>


<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Order"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>  <%-- Step 1: import package  business() class--%>

<%

Order order=new Order();// Step 2 : Create object of the class


String oid=request.getParameter("oid");
String sdate=request.getParameter("sdate");
String status=request.getParameter("status");

int _oid=Integer.parseInt(oid);




System.out.println("======action page========"+oid);
System.out.println("======action page========"+sdate);


order.setOmid(_oid);
order.setOmdate(sdate);
order.setOmstatus(status);

boolean check_flag=OrderDAO.updateOrderStatus(order); 




if(check_flag){
   
    response.sendRedirect("AdDeliveryUpdate.jsp?v=4");  
}
else{
         response.sendRedirect("AdDeliveryUpdate.jsp?v=3");  
  
}



%>

