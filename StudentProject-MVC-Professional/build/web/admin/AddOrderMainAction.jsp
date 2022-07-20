<%-- 
    Document   : loginAction
    Created on : jun 14, 2017, 4:01:21 PM
    Author     : sibin
--%>


<%@page import="java.util.StringTokenizer"%>
<%@page import="com.laundrymgt.beans.Order"%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>


<%
    int cid=0;
    String odate=request.getParameter("odate");
    String otime=request.getParameter("otime");
    String id=request.getParameter("cid");
          System.out.println("cid with name----------------------"+id);
    
   // StringTokenizer st=new StringTokenizer(id);
    
    //cid=Integer.parseInt(st.nextToken("-"));
   // System.out.println("tokenizer----------------------"+st.nextToken("-"));
   String[] sp=id.split("-");
   cid=Integer.parseInt(sp[0]);
   System.out.println("tokenizer----------------------"+cid);       
    Order order=new Order();
    OrderDAO odao=new OrderDAO();
    
    order.setCid(cid);
    order.setOmtime(otime);
    order.setOmdate(odate);
    
    boolean check_flag=odao.insertOrder(order);
    
    if(check_flag){
       //  response.sendRedirect("demo.jsp?v=2"); 
	  response.sendRedirect("AdOrderSubItems.jsp");
    }
    else{
        
    }
    
    

%>