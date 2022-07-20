<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Item"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.ItemDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    String id=request.getParameter("id");	
	System.out.println("---id----"+id);	
	
	
	Item item=new Item();// Step 2 : Create object of the class
	item.setItemid(Integer.parseInt(id));	
	
	boolean flag=ItemDAO.deleteItem(item);
	
	 
	   if(flag){    
        	response.sendRedirect("AdItemVED.jsp?v=5");
        }   
       else{
        	response.sendRedirect("AdItemVED.jsp?v=3");
        }
	
%>


