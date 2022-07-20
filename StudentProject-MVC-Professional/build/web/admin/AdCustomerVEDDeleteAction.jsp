<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Customer"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.CustomerDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    String id=request.getParameter("id");	
	System.out.println("---id----"+id);	
	
	
	Customer customer=new Customer();// Step 2 : Create object of the class
	customer.setCid(Integer.parseInt(id));
	
	boolean flag=CustomerDAO.deleteCustomer(customer);
	
	 
	   if(flag){    
        	response.sendRedirect("AddCustomerVED.jsp?v=5");
        }   
       else{
        	response.sendRedirect("AddCustomerVED.jsp?v=3");
        }
	
%>


