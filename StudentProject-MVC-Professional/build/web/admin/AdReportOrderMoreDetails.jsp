<%@ include file="AHeader.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Order"%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>



<%

			String id=request.getParameter("id");
           	int oid=Integer.parseInt(id);
			
			 session.setAttribute("omid",oid);
			
			 
			
                                  

%>
<body onclick="hideCaption();">

<div class="login_outer">
<div class="cnt">
<h1>Order Report</h1>






<div style="clear:right;">

<!-- ................................FIRST - START................................ -->
 <%
             
				 ArrayList<Order>orderz =OrderDAO.reportOrderMainDetailsMore(oid);
				if(orderz.size()>0){
%>
<form name="orderList" >

   
		         <table width="100%" border="0" align="left" cellpadding="2" cellspacing="2">
				
                              <tr>
							  <td height="60" colspan="11"  style="font-size:14; align:center; border-left:solid 1px #999999; border-right:solid 1px #999999;border-top:solid 1px #999999;border-bottom:solid 1px #999999;"><h2 align="center">Laundry Management - Order Report </h2></td>
                              </tr>
                              
							   <tr>
                                <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Order ID</strong></h3></th>
                                
                                  <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Customer Name</strong></h3></th>
                                  
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Order Date</strong></h3></th>
                                    
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;border-right:solid 1px #999999;;" width="68" class="txtstyle4"><h3 align="center"><strong>Order Time</strong></h3></th>
								
                              </tr>
                             <%
         
                        
   			for(Order invoicezz : orderz){
                              
                %>               
                        
  
   <tr>
                                <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezz.getOmid()%></h3></th>
                                  <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezz.getCname()%></h3></th>
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezz.getOmdate()%></h3></th>
                                        <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;border-right:solid 1px #999999;" width="68" class="rbrd"><h3 align="center"><%=invoicezz.getOmtime()%></h3></th>
                                    
                            
                              </tr>
 
      <%}%>
  
</table>

<!-- -------------------sub items ---------------------->
<%
 ArrayList<Order>orderzz =OrderDAO.reportOrderSubDetailsMore(oid);
 %>

 <table width="100%" border="0" align="left" cellpadding="2" cellspacing="2">
				
                              <tr>
							 
                              </tr>
                              
							   <tr>
                                 <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>SI NO.</strong></h3></th>
                                <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Item ID</strong></h3></th>
                                
                                  <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Item Name</strong></h3></th>
                                  
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Quantitiy</strong></h3></th>
                                    
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Price</strong></h3></th>
                                    
                                     <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999; border-right:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Total</strong></h3></th>
								
                              </tr>
                             <%
         
                          int i=1;
   			for(Order invoicezzz : orderzz){
                            
                %>               
                        
  
   <tr>
     <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=i++%></h3></th>
                                <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezzz.getItemid()%></h3></th>
                                  <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezzz.getItemname()%></h3></th>
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezzz.getOsquantity()%></h3></th>
                                        <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezzz.getOsprice()%></h3></th>
                                         <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;border-right:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezzz.getTotal()%></h3></th>
                                    
                            
                              </tr>
 
      <%
	 
	  }%>
  
  
  
</table>


<!-- -------------------total ---------------------->
<%
 float gTotal =OrderDAO.reportOrderSubDetailsMoreGandTotal(oid);
 %>

 <table width="100%" border="0" align="left" cellpadding="2" cellspacing="2">
				
                             
                              
							   <tr>
                           

 
    <td colspan="5" class="rbrd" align="center" style="color: red;border-left:solid 1px #999999; border-right:solid 1px #999999;border-top:solid 1px #999999;border-bottom:solid 1px #999999;"><h3 align="right"><strong>Grand Total</strong></h3></td>
								
                              </tr>
                               <tr>
                           

 
    <td colspan="5" class="rbrd" align="center" style="color: red;border-left:solid 1px #999999; border-right:solid 1px #999999;border-top:solid 1px #999999;border-bottom:solid 1px #999999;"><h3 align="right"><%=gTotal%></h3></td>
								
                              </tr>
                           
  
   
  
  
</table>


 
</form>
<%}%>

<table width="100%" border="0" align="center" cellspacing="10" >
<tr>

 
    <td colspan="5" class="rbrd" align="center" style="border-left:solid 1px #999999; border-right:solid 1px #999999;border-top:solid 1px #999999;border-bottom:solid 1px #999999;"><h3 align="center">
        <!--    <input type="image" src="images/pdf.png" name="button" id="button" onClick="window.open('AdReportDailyIncStatementPDF.jsp')" value="Print" />-->
            
           <input type="submit" name="addOrder" id="button" onClick="window.open('AdReportOrderMoreDetailsPDF.jsp')" value="Print PDF" class="sbt_01" tabindex="9"/>
          </td>
   
 </tr>
</table>
</div>
</div>




