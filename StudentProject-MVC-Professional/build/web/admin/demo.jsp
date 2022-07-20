
<%@ include file="AHeader.jsp" %>
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.dao.OrderDAO"%>
<%@page import="com.laundrymgt.beans.Order"%>



<script language="javascript">
function valForm()
{
      
		
                var v=document.items.submit.value;
                alert("----------v--------"+v);
		if((document.items.qty.value===""))
        {
             alert("Enter  quantity");
             document.items.qty.focus();
             return false;
        }	
		if(isNaN(document.items.qty.value))
        {
             alert("Enter valid Quantity");
             document.items.qty.focus();
             return false;
        }	
		
	document.items.submit();
}

</script>

<%

String itm=request.getParameter("itm");
String qty = request.getParameter("qty");
           






	
%>
	
<body >
<div class="login_outer">
<div class="cnt">
<h1 class="cnt">BILL</h1>

<form>


<table width="100%" border="0" cellspacing="6" cellpadding="6">

  <%
	
			
	
                        
       
	
	  		
			ArrayList<Order>orc =OrderDAO.retrieveCustomerOrder();
			
			System.out.println("helloo-------------------------retrieveCustomerOrder()----------------------------");
			
			for(Order or : orc){              
                      session.setAttribute("omid", or.getOmid());
%>
 
      
  <tr>        
            <td>Order ID</td>
            <td width="17%"> <%=or.getOmid()%></td>
             <td>Customer</td>
            <td width="17%"><%=or.getCname()%></td>
             <td>Order Date</td>
            <td width="17%"> <%=or.getOmdate()%></td>
            <td>Order Time</td>
            <td width="17%"><%=or.getOmtime()%> </td>
 </tr>
 <%}%>
 <tr>        
            
 </tr>
<!--              closing }   -->
  </table>

</form>


<!--------------------------------------first form closed here---------------------------------->


<form name="orderList" action="demo.jsp" method="post" onsubmit="return valForm();">
<fieldset > 

<table width="100%" border="0" cellspacing="6" cellpadding="6">

 
      
  <tr>        
            <td>ITEM</td>
            <td>   
            <label for="textfield"></label>
      <select name="itm">
     <option>---SELECT ONE--</option>
  
       <%

 	

	//Order orderi=new Order();
	//order.setCid(id1); //Step 3: setting values from jsp to setter/getter class
	  		
      
			ArrayList<Order> oro=OrderDAO.retrieveItems();
                        
                           
			for(Order orcc : oro){    
                                     String cidname=orcc.getItemid()+"-"+orcc.getItemname();
                         
                           
                          //  System.out.println(cidname);
                       

%> 
        
 <option><%=cidname%></option>

       <%}%>
    
     </select>
    </td>
         <td width="10%">QUANTIY</td>
         <td width="17%">   <input name="qty" type="text" id="qty" value="" placeholder="Enter Quantity . "  tabindex="2" required  /></td>
      </tr>
 <tr>        
            <td colspan="6" align="right"> <input type="submit" name="addOrder" id="button" value="Add New" class="sbt_01" tabindex="9"/></td>
 </tr>
 
  </table>
</fieldset>
</form>

<!--------------------------------------------------------------second form closed here-------------------------->


<form name="orderList2">
    <table width="100%" border="0" cellspacing="1" cellpadding="0"
           align="center">
        <tr>
            <td width="17%">&nbsp;</td>
            <td width="8%">&nbsp;</td>
            <td width="14%">&nbsp;</td>
            <td width="13%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
           
           
        </tr>
        
        <tr bgcolor="#000000">
            <td align="center" ><font color="#FFFFFF"/>SI.No</td>
            <td align="center"><font color="#FFFFFF"/>Item</td>
            <td align="center"><font color="#FFFFFF"/>Quantity</td>
            <td align="center"><font color="#FFFFFF"/>Price</td>           
            <td align="center"><font color="#FFFFFF"/>Total</td>
        </tr>
        <%

                    //orderId = request.getParameter("orderId");


                    int flag = 0;
                    String c = "#E0E0E0";



                    ArrayList al1 = ttt.retTicketSub();
                    String str1[] = null;
                    float grandTotal = 0.0f;

                    for (int i = 0; i < al1.size(); i++) {
                        str1 = (String[]) al1.get(i);                        
                        if (flag == 0) {
                            c = "#E0E0E0";
                            flag = 1;
                        } else if (flag == 1) {
                            c = "#FFFFFF";
                            flag = 0;
                        }
        %>
        <tr bgcolor= "<%=c%>">
            <td align="center">
                <%=str1[0]%>
            </td>
            <td align="center">
                <%=str1[1]%>
            </td>
            <td align="center">
                <%=str1[2]%>
            </td>
            <td align="center">
                <%=str1[3]%>

            </td>
            <td align="center">
                <%=str1[4]%>

           
          
            <%

                            grandTotal = grandTotal + Float.parseFloat(str1[8]);
            %>
        </tr>

        <%}%>
        <tr>
            <td width="17%">&nbsp;</td>
            <td width="8%">&nbsp;</td>
            <td width="14%">&nbsp;</td>
            <td width="13%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
           
           
        </tr>
        <tr>

            <td  colspan="4" align="right">Total = </td>
            <td><%=grandTotal%>
                <input name="grandTotal"  value="<%=grandTotal%>"  type="hidden" class="formtxtstyle" />

        </tr>
        <tr>
            <td width="17%">&nbsp;</td>
            <td width="8%">&nbsp;</td>
            <td width="14%">&nbsp;</td>
            <td width="13%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
           
        </tr>
        
        
    <tr>   
    <td colspan="9" align="center">
    
     <a href="AdTicketEntry.jsp?v=0"><input type="button" name="button" id="button" value="Back"  class="sbt_01"  /></a>
       
       <a href="AdTicketPrintPDF.jsp" target="_blank"><input type="button" name="button" id="button" value="Print"  class="sbt_01"  /></a> 
    </td>
  </tr>


    </table>
</form>






</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>





