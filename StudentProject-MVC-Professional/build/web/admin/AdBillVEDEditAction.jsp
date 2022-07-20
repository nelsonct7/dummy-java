
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Bill"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.BillDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    int bid=Integer.parseInt(request.getParameter("id"));
    int oid=Integer.parseInt(request.getParameter("omid"));	
	Float paid=Float.parseFloat(request.getParameter("paid"));
	String bdate=request.getParameter("bdate");
	Bill bill=new Bill();
	bill.setBid(bid);
	bill.setOmid(oid);
	bill.setPaid(paid);
	bill.setBdate(bdate);
	boolean flag=BillDAO.updateBill(bill);
	if(flag) {
        	 response.sendRedirect("AdBillVED.jsp?v=4");
        }   
    else{
        response.sendRedirect("AdBillVED.jsp?v=3");
        }
	
%>

