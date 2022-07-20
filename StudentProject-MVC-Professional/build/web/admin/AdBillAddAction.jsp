<%-- 
    Document   : bill Action
    Created on : August 24, 2017, 4:01:21 PM
    Author     : BINI
--%>


<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Bill"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.BillDAO"%>  <%-- Step 1: import package  business() class--%>

<%

Bill bill=new Bill();// Step 2 : Create object of the class


String oid=request.getParameter("oid");
String bdate=request.getParameter("bdate");
String pamt=request.getParameter("pamt");

int _oid=Integer.parseInt(oid);
float _pamt=Float.parseFloat(pamt);



System.out.println("======action page========"+oid);
System.out.println("======action page========"+bdate);


bill.setOmid(_oid);
bill.setBdate(bdate);
bill.setPaid(_pamt);

boolean check_flag=BillDAO.insertBill(bill); 




if(check_flag){
   
    response.sendRedirect("AdBillAdd.jsp?v=2");  
}
else{
         response.sendRedirect("AdBillAdd.jsp?v=3");  
  
}



%>

