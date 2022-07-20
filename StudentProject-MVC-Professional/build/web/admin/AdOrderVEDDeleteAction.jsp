<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Order"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    String id=request.getParameter("id");	
	System.out.println("---id----"+id);	
	
	
	Order order=new Order();// Step 2 : Create object of the class
	order.setOmid(Integer.parseInt(id));	
	
	boolean flag=OrderDAO.deleteOrder(order);
	
	 
	   if(flag){    
        	response.sendRedirect("AdOrderVED.jsp?v=5");
        }   
       else{
        	response.sendRedirect("AdOrderVED.jsp?v=3");
        }
	
%>

