<%-- 
    Document   : loginAction
    Created on : Feb 9, 2017, 4:01:21 PM
    Author     : BINI
--%>


<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Customer"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.CustomerDAO"%>  <%-- Step 1: import package  business() class--%>

<%

Customer customer=new Customer();// Step 2 : Create object of the class


String ctype=request.getParameter("ctype");
String cname=request.getParameter("cname");
String caddress=request.getParameter("caddress");
String mobile=request.getParameter("mobile");
String cemail=request.getParameter("cemail");



System.out.println("======action page========"+ctype);
System.out.println("======action page========"+cname);
System.out.println("======action page========"+caddress);
System.out.println("======action page========"+mobile);
System.out.println("======action page========"+cemail);


customer.setCtype(ctype);
customer.setCname(cname);
customer.setCaddress(caddress);
customer.setMobile(mobile);
customer.setCemail(cemail);
//Step 3: setting values from jsp to setter/getter class
//Step 3: setting values from jsp to setter/getter class

boolean check_flag=CustomerDAO.getCustomer(customer); //Step 5: calling  from business class using setter/getter class for getting getter values



// You need to pass the object of the getter/setter class eg: psgs from here. Otherwise you
//need to create an object of setter/getter class in the business class. In that case default construtor
// of the getter/setter class will invoke and assign '\000\' values to private variables. We need
//already set values , not the null value. so you must pass object of the getter/setter class from 
//here.




if(check_flag){
   
    response.sendRedirect("AdCustomerAdd.jsp?v=1");  
}
else{
	boolean in_flg=CustomerDAO.insertCustomer(customer);
    if(in_flg){
        
         response.sendRedirect("AdCustomerAdd.jsp?v=2");  
    }
    else{
         response.sendRedirect("AdCustomerAdd.jsp?v=3");  
    }
}



%>

