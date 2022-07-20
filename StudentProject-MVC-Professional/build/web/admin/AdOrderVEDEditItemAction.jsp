
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Order"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    
    int id=Integer.parseInt(request.getParameter("id"));	
	String item=request.getParameter("item");
	float quant=Float.parseFloat(request.getParameter("quant"));
        float price=Float.parseFloat(request.getParameter("itprice"));
        float tot=quant*price;
	Order order=new Order();
	
	order.setOsid(id);
	order.setItemname(item);
        order.setOsquantity(quant);
        order.setOsprice(price);
	order.setTotal(tot);
	
boolean flag=OrderDAO.updateOrderItem(order); //Step 5: calling  from business class using setter/getter class for getting getter values
	if(flag) {
        	 response.sendRedirect("AdOrderVED.jsp?v=4");
        }   
    else{
        response.sendRedirect("AdOrderVED.jsp?v=3");
        }
	
%>


