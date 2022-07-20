
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Item"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.ItemDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    String id=request.getParameter("id");	
	String iname=request.getParameter("iname");
	String iprice=request.getParameter("iprice");
	
Item item=new Item();// Step 2 : Create object of the class
item.setItemid(Integer.parseInt(id));	
item.setItemname(iname); //Step 3: setting values from jsp to setter/getter class
item.setItemprice(Float.parseFloat(iprice));//Step 3: setting values from jsp to setter/getter class
	
	
boolean flag=ItemDAO.updateItem(item); //Step 5: calling  from business class using setter/getter class for getting getter values
	if(flag) {
        	 response.sendRedirect("AdItemVED.jsp?v=4");
        }   
    else{
        response.sendRedirect("AdItemVED.jsp?v=3");
        }
	
%>


