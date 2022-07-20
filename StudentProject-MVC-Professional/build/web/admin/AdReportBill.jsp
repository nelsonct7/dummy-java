<%@ include file="AHeader.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Bill"%>
<%@page import="com.laundrymgt.dao.BillDAO"%>

<script type="text/javascript" src="calendarDateInput.js">
</script>

<%

			String fdate=request.getParameter("fdate");
            String tdate = request.getParameter("tdate");
			
			 session.setAttribute("bfromdate",fdate);
			 session.setAttribute("btodate",tdate);
			 
				Bill bill=new Bill();
				
				bill.setBfdate(fdate);
				bill.setBtodate(tdate);
                                   ArrayList<Bill>bills =BillDAO.reportBillDetails(bill);

%>
<body onclick="hideCaption();">

<div class="login_outer">
<div class="cnt">
<h1>Bill Report</h1>



<form name="order" method="post" action="AdReportBill.jsp" >
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
				if(bills.size()>0){
%>
<form name="orderList" >

   
		         <table width="100%" border="0" align="left" cellpadding="2" cellspacing="2">
				
                              <tr>
							 <td height="60" colspan="11"  style="font-size:14; align:center; border-left:solid 1px #999999; border-right:solid 1px #999999;border-top:solid 1px #999999;border-bottom:solid 1px #999999;"><h2 align="center">Laundry Management - Bill Report </h2></td> 
                              
							   <tr>
                              
                                
                                
                               <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Bill ID</strong></h3></th>  
                                
                                
                                 <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Order ID</strong></h3></th>
                                  
                                   
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Paid Date</strong></h3></th>
                                    
                                    
                                    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;border-right:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><strong>Paid Amount</strong></h3></th>
                                    
                                   
                                    
                              </tr>
                              
                               <%
         
                        
   			for(Bill bilz : bills){
                              
                %>               
                        
  
   <tr> <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=bilz.getBid()%></h3></th>
   
    <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=bilz.getOmid()%></h3></th>
   
               <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=bilz.getBdate()%></h3></th>                   
                                
                           <th style="font-size: 14;border-left:solid 1px #999999; border-top:solid 1px #999999;border-bottom:solid 1px #999999; border-right:solid 1px #999999;" width="68" class="txtstyle4"><h3 align="center"><%=bilz.getPaid()%></h3></th>              
                                  
                                    
                                   
                            
                              </tr>
 
      <%}%>
  
                              
                              
                           
</table>
 
</form>
<%}%>

<table width="100%" border="0" align="center" cellspacing="10" >
<tr>

 
    <td colspan="5" class="rbrd" align="center" style="border-left:solid 1px #999999; border-right:solid 1px #999999;border-top:solid 1px #999999;border-bottom:solid 1px #999999;"><h5 align="center">
        <!--    <input type="image" src="images/pdf.png" name="button" id="button" onClick="window.open('AdReportDailyIncStatementPDF.jsp')" value="Print" />-->
            
           <input type="submit" name="addOrder" id="button" onClick="window.open('AdReportBillPDF.jsp')" value="Print PDF" class="sbt_01" tabindex="9"/>
          </td>
   
 </tr>
</table>
</div>
</div>




