<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Bill"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.BillDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    String id=request.getParameter("id");	
	System.out.println("---id----"+id);	
	
	
	Bill bill=new Bill();// Step 2 : Create object of the class
	bill.setBid(Integer.parseInt(id));	
	
	boolean flag=BillDAO.deleteBill(bill);
	
	 
	   if(flag){    
        	response.sendRedirect("AdBillVED.jsp?v=5");
        }   
       else{
        	response.sendRedirect("AdBillVED.jsp?v=3");
        }
	
%>


