<%@ include file="AHeader.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Order"%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>

<script type="text/javascript" src="calendarDateInput.js">
</script>

<%

			String fdate=request.getParameter("fdate");
            String tdate = request.getParameter("tdate");
			
			 session.setAttribute("fromdate",fdate);
			 session.setAttribute("todate",tdate);
			 
				Order orderb=new Order();
				
				orderb.setOfdate(fdate);
				orderb.setOtodate(tdate);
                                   ArrayList<Order>orderz =OrderDAO.reportOrderDetails(orderb);

%>
<body onclick="hideCaption();">

<div class="login_outer">
<div class="cnt">
<h1>Order Report</h1>



<form name="order" method="post" action="AdReportOrder.jsp" >
<table width="100%" border="0" align="center" cellspacing="10" >

  <tr>
    <td width="40%">&nbsp;</td>
    <td width="85%">&nbsp;</td>
  </tr>

 <tr>
    <td align="right" class="txtstyle4">From </td>
     <td width="53%">
       <script>DateInput('fdate', true, 'YYYY-MM-DD')</script>
       </td>	
	   <td>   
  </td>
  </tr>
   <tr>
    <td align="right" class="txtstyle4">To </td>
     <td width="53%">
       <script>DateInput('tdate', true, 'YYYY-MM-DD')</script>
       </td>	
	   <td>   
  </td>
  </tr>
  
  <tr>
    
  <!--  <td><label>
      <input type="image" src="images/report.png" name="button" id="button" value="Search" />
      
     </label></td>-->
     
       <td colspan="2" align="center"> <input type="submit" name="addOrder" id="button" value="Print Report" class="sbt_01" tabindex="9"/>
          </td>
  </tr>
</table>
</form>




<div style="clear:right;">

<!-- ................................FIRST - START................................ -->
 <%
             
				System.out.println("sgdfgysdifgi");
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
                                    
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Order Time</strong></h3></th>
                                    
                                     <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Price</strong></h3></th>
                                     
                                      <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;border-right:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>View Details</strong></h3></th>
                                    
                                    
                                     

								
                              </tr>
                             <%
         
                        
   			for(Order invoicezz : orderz){
                              
                %>               
                        
  
   <tr>
                               
                                
                                 <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezz.getOmid()%></h3></th>
                                                                        
                                      <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezz.getCname()%></h3></th>
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=invoicezz.getOmdate()%></h3></th>
                                        <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="rbrd"><h3 align="center"><%=invoicezz.getOmtime()%></h3></th>   
                                        
                                 <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="rbrd"><h3 align="center"><%=invoicezz.getTotal()%></h3></th>   
                                         
                                     <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="rbrd"><h3 align="center"><%=invoicezz.getTotal()%></h3></th>               
                                   	
                                      <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;border-right:solid 1px #999999;" width="68" class="rbrd"><h5 align="center"><div class="pr_edit"><a href="AdReportOrderMoreDetails.jsp?id=<%=invoicezz.getOmid()%>">More</a></div></h5></th>							
                            
                              </tr>
 
      <%}%>
  
</table>
 
</form>
<%}%>

<table width="100%" border="0" align="center" cellspacing="10" >
<tr>

 
    <td colspan="5" class="rbrd" align="center" style="border-left:solid 1px #999999; border-right:solid 1px #999999;border-top:solid 1px #999999;border-bottom:solid 1px #999999;"><h5 align="center">
        <!--    <input type="image" src="images/pdf.png" name="button" id="button" onClick="window.open('AdReportDailyIncStatementPDF.jsp')" value="Print" />-->
            
           <input type="submit" name="addOrder" id="button" onClick="window.open('AdReportOrderPDF.jsp')" value="Print PDF" class="sbt_01" tabindex="9"/>
          </td>
   
 </tr>
</table>
</div>
</div>




