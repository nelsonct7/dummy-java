<%-- 
    Document   : loginAction
    Created on : Feb 9, 2017, 4:01:21 PM
    Author     : BINI
--%>


<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.beans.Item"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.ItemDAO"%>  <%-- Step 1: import package  business() class--%>

<%

Item item=new Item();// Step 2 : Create object of the class
ItemDAO idao=new ItemDAO();

String iname=request.getParameter("iname");
String iprice=request.getParameter("iprice");

float itprice=Float.parseFloat(iprice);

System.out.println("======action page========"+iname);
System.out.println("======action page========"+iprice);

item.setItemname(iname); //Step 3: setting values from jsp to setter/getter class
item.setItemprice(itprice);//Step 3: setting values from jsp to setter/getter class

boolean check_flag=idao.getItem(item); //Step 5: calling  from business class using setter/getter class for getting getter values



// You need to pass the object of the getter/setter class eg: psgs from here. Otherwise you
//need to create an object of setter/getter class in the business class. In that case default construtor
// of the getter/setter class will invoke and assign '\000\' values to private variables. We need
//already set values , not the null value. so you must pass object of the getter/setter class from 
//here.





if(check_flag){
  
    response.sendRedirect("AdItemtAdd.jsp?v=1");  
}
else{
	
	 boolean in_flg=idao.insertItem(item);
    if(in_flg){
        System.out.println("in_flg  "+in_flg);
         response.sendRedirect("AdItemtAdd.jsp?v=2");  
    }
    else {
         response.sendRedirect("AdItemtAdd.jsp?v=3");  
    }
}



%>

