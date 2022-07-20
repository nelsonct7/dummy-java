<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Order"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    int id=Integer.parseInt(request.getParameter("id"));	
	System.out.println("---id----"+id);	
	
	
	boolean flag=OrderDAO.deleteOrderItem(id);
	
	 
	   if(flag){    
        	response.sendRedirect("AdOrderVED.jsp?v=5");
        }   
       else{
        	response.sendRedirect("AdOrderVED.jsp?v=3");
        }
	
%>
