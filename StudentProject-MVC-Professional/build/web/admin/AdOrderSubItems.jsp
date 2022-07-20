

<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Order"%>
<%@page import="com.laundrymgt.beans.Item"%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>
<%@page import="com.laundrymgt.dao.ItemDAO"%>

<%@ include file="AHeader.jsp" %>



<script language="javascript">
function valForm()
{
	   var o=document.orderList.itemname.value;
       if(o=="--SELECT ONE--")
        {
                alert("Select an Item");
				document.orderList.itemname.focus();
				return false;
		}
		if(document.orderList.qty.value=="")
        {
             alert("Enter Quantity");
             document.orderList.qty.focus();
             return false;
        }	
		if(isNaN(document.orderList.qty.value))
        {
             alert("Enter valid Quantity");
             document.orderList.qty.focus();
             return false;
        }	
		
	document.orderList.submit();
}

</script>

<%

			String itemname=request.getParameter("itemname");
            String qty = request.getParameter("qty");
			String orderidz = request.getParameter("orderidz");
			
          //  System.out.println("============itemname          "+  itemname);       
			
            String submit = request.getParameter("addOrder");
			
			
			
            if (submit != null) {
				
				System.out.println(" am in submit =  "+submit);
				
			String _itemparts[] = itemname.split("-");
				String _iid = _itemparts[0]; 
				String _iiname = _itemparts[1]; 
				
			//	 System.out.println("============_iid         "+  _iid);       
			//	System.out.println("============_iiname         "+  _iiname);
				
	  
			int _oid=Integer.parseInt(orderidz);
			int _lid=Integer.parseInt(_iid);
			int _qty=Integer.parseInt(qty);
				
						Order orderb=new Order();
    
						orderb.setOmid(_oid);
						orderb.setItemid(_lid);
						orderb.setOsquantity(_qty);
						
    					OrderDAO.addInvoice(orderb);
            } 
			else if (submit == null ) {
                boolean flag = OrderDAO.truncateInvoice();
				System.out.println(" am in submit = null "+submit);
            }




%>








<body onclick="hideCaption();">
<div class="login_outer">
<div class="cnt">
<h1>ORDER  </h1>

<!-- ................................FIRST - START................................ -->

<form>

<table width="35%" border="0" cellspacing="6" cellpadding="6">

 

 <tr>
           
    <td width="21%"><label>Order No</label></td> <td width="79%">Customer Name</td>
    <td width="79%">Order Date</td><td width="79%">Order Time</td>
  
    </tr>
    <%
	
		ArrayList<Order>order =OrderDAO.retLastOrder();
         
                        
   			for(Order invoice : order){
                              
                               
             %>    
             <tr>              
                           
                   
  <td> <input name="orderid" type="text" id="orderid" value="<%=invoice.getOmid()%>" readonly /></td>
  <td> <input name="customer" type="text" id="customer" value="<%=invoice.getCname()%>" readonly/></td> 
  <td> <input name="orderid" type="text" id="orderid" value="<%=invoice.getOmdate()%>" readonly /></td>
  <td> <input name="customer" type="text" id="customer" value="<%=invoice.getOmtime()%>" readonly/></td>  
          
	<%}
	%>


       
         
       
       </tr>
       
       <tr>
 <td>&nbsp;</td>
 </tr>
</table>



</form>


<!-- ................................FIRST - END................................ -->




<!-- ................................SECOND - START................................ -->

<form name="orderList" action="AdOrderSubItems.jsp" method="post" >
      
      
<fieldset > 

<table width="502">
       
   <%
	
		ArrayList<Order>orderz =OrderDAO.retLastOrder();
         
                        
   			for(Order invoicez : orderz){
                              
                               
             %>    
             <tr>              
                           
                 <td>   <input name="orderidz" type="hidden" id="orderidz" value="<%=invoicez.getOmid()%>" readonly /></td>
       <tr> 
       <%}%>   
             <td>Item Details</td>
               <td>   <select name="itemname" id="itemname" tabindex="3" >
             <option>--SELECT ONE--</option>
             <%
             
           ArrayList<Item>items =ItemDAO.listItems();
         
                        
   			for(Item ite : items){
				
				String _iidname=ite.getItemid()+"-"+ite.getItemname();
                              
                               
             %>   
             
          
             <option><%=_iidname%></option>
             <%}%>
             </select>
            </td>

 
               <td>Quantity</td>
            <td>   <input name="qty" type="text" id="qty" value="" placeholder="Enter Quantity. "  tabindex="7" required  /></td>
            
       </tr>     
          
       <tr>
            
            
                
            <td colspan="4" align="right"> <input type="submit" name="addOrder" id="button" value="Place Order" class="sbt_01" tabindex="9"  onClick="return valForm();"/>
          </td> 
            
            
 </tr>
 
  </table>
</fieldset>
</form>


<!-- ................................SECOND - END................................ -->

<!-- ................................THIRD - START................................ -->

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
            <td align="center"><font color="#FFFFFF"/>Item Name</td>
            <td align="center"><font color="#FFFFFF"/>Price</td>
            <td align="center"><font color="#FFFFFF"/>Quantity</td>
            <td align="center"><font color="#FFFFFF"/>Total</td>
           
        </tr>
        <%

                    //orderId = request.getParameter("orderId");


                    int flag = 0;
                    String c = "#E0E0E0";

float grandTotal = 0.0f;
 int _sno=1;
 ArrayList<Order>obean =OrderDAO.retLastOrderItems();
         
                        
   			for(Order ob : obean){
				
				
                             
            
                    

                                        
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
                <%=_sno%>
            </td>
            <td align="center">
                <%=ob.getItemname()%>
            </td>
            <td align="center">
                <%=ob.getOsquantity()%>
            </td>
            <td align="center">
                <%=ob.getOsprice()%>

            </td>
            <td align="center">
                <%=ob.getTotal()%>

            </td>
            
            <%

                            grandTotal = grandTotal + (float)ob.getTotal();
            %>
        </tr>

        <%
		_sno++;
		
		}%>
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
    
     <a href="AddOrderMain.jsp?v=0"><input type="button" name="button" id="button" value="Back"  class="sbt_01"  /></a>
       
       <a href="AdOrderPrintPDF.jsp" target="_blank"><input type="button" name="button" id="button" value="Print"  class="sbt_01"  /></a> 
    </td>
  </tr>


    </table>
</form>

  <!-- ................................THRID - END................................ -->


</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>
