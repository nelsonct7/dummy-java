
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Order"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    
    int id=Integer.parseInt(request.getParameter("omid"));	
	String cust=request.getParameter("cust");
	String odate=request.getParameter("odate");
	
	Order order=new Order();
	
	order.setOmid(id);
	order.setCname(cust);
	order.setCid(OrderDAO.retCustid(cust));
	order.setOmdate(odate);

	
boolean flag=OrderDAO.updateOrderMain(order); //Step 5: calling  from business class using setter/getter class for getting getter values
	if(flag) {
        	 response.sendRedirect("AdOrderVED.jsp?v=4");
        }   
    else{
        response.sendRedirect("AdOrderVED.jsp?v=3");
        }
	
%>


