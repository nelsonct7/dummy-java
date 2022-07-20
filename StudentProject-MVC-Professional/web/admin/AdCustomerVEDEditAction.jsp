
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Customer"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.CustomerDAO"%>  <%-- Step 1: import package  business() class--%>


<%
    String id=request.getParameter("id");	
    String ctype=request.getParameter("ctype");
    String cname=request.getParameter("cname");
    String caddress=request.getParameter("caddress");
    String mobile=request.getParameter("mobile");
    String email=request.getParameter("cemail");
	
Customer customer=new Customer();// Step 2 : Create object of the class

customer.setCid(Integer.parseInt(id));
customer.setCtype(ctype);
customer.setCname(cname);
customer.setCaddress(caddress);
customer.setMobile(mobile);
customer.setCemail(email);
	
//item.setItemname(iname); //Step 3: setting values from jsp to setter/getter class
//item.setItemprice(Float.parseFloat(iprice));//Step 3: setting values from jsp to setter/getter class
	
System.out.println("1");	
boolean flag=CustomerDAO.updateCustomer(customer); //Step 5: calling  from business class using setter/getter class for getting getter values
System.out.println("5");
	if(flag) {
        	 response.sendRedirect("AddCustomerVED.jsp?v=4");
        }   
    else{
        response.sendRedirect("AddCustomerVED.jsp?v=3");
        }
	
%>

