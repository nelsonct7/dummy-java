
<%@ include file="AHeader.jsp" %>
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.laundrymgt.dao.OrderDAO"%>
<%@page import="com.laundrymgt.beans.Order"%>






<script language="javascript">
function valForm()
{
       if(document.bill.amt.value==="")
        {
                alert("Enter Amount");
				document.bill.amt.focus();
				return false;
		}
		
		if(isNaN(document.bill.amt.value))
        {
             alert("Enter valid Amount");
             document.bill.amt.focus();
             return false;
        }	
		
	document.bill.submit();
}

</script>
	<%

	    String cid=request.getParameter("cid");
            String price = request.getParameter("price");
            String amt = request.getParameter("quantity");
	
	
	
		
   if (submit != null) {
         ttt.insertTicketSub(ti_main_id,npass,status,sloc,desti,bodate,tme,noseats,tcharge,scharge,cid);  //insert itno origianl table, dummy table
			   
			   
            } else if (submit == null ) {
                boolean flag = ttt.truncateTicketSub();
            }
            


%>

<body >
<div class="login_outer">
<div class="cnt">
<h1 class="cnt">BILL</h1>

<form>


<table width="100%" border="0" cellspacing="6" cellpadding="6">

  <%
	
			
			
			  	
	/*  			
			
            ArrayList al=new ArrayList(); 
            al=OrderDAO.retrieveCustomerOrder();
            String st[]=null;         
                
            for(int i=0;i<al.size();i++){                  
                    st=(String[])al.get(i);                   
                	
	*/	
                        
       
	
	  		
			ArrayList<Order>orc =OrderDAO.retrieveCustomerOrder();
			for(Order or : orc){              
			
%>
 
      
  <tr>        
            <td>Order ID</td>
            <td width="17%"> <%=or.getCid()%></td>
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


<form name="bill" action="ItemCalcAction.jsp" method="post" onSubmit="return valForm();">
<fieldset > 

<table width="100%" border="0" cellspacing="6" cellpadding="6">

 
      
  <tr>        
            <td>ITEM</td>
            <td>   
            <label for="textfield"></label>
      <select name="item">
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
         <td width="17%">   <input name="quantity" type="text" id="amt" value="" placeholder="Enter Amount . "  tabindex="2" required=""  /></td>
      </tr>
 <tr>        
            <td colspan="6" align="right"> <input type="submit" name="Add New" id="button" value="Add New" class="sbt_01" tabindex="9"/></td>
 </tr>
 
  </table>
</fieldset>
</form>

<!--------------------------------------------------------------second form closed here-------------------------->



<form name="bill2">
    <table width="100%" border="0" cellspacing="1" cellpadding="0"
           align="center">
        <tr>
            <td width="4%">&nbsp;</td>
            <td width="68%">&nbsp;</td>
            <td width="14%">&nbsp;</td>         
           
        </tr>
        
        <tr bgcolor="#000000">
            <td align="center" ><font color="#FFFFFF"/>SLNO</td>
            <td align="center"><font color="#FFFFFF"/>ITEM</td>
            <td align="center"><font color="#FFFFFF"/>QUANTITY</td>
            <td align="center"><font color="#FFFFFF"/>PRICE</td>
        </tr>
        <%

                    //orderId = request.getParameter("orderId");


                      
                      
                     
			  
                    int flag = 0;
                    String c = "#E0E0E0";



                //   ArrayList al1 = ttt.retTicketSub();------------------------from dummy table
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
                <%=i+1%>
            </td>
            <td align="center">
                <%=str1[0]%>
            </td>
            <td align="center">
                <%=str1[1]%>
            </td>
           
            <%

                            grandTotal = grandTotal + Float.parseFloat(str1[8]);
            %>
        </tr>

        <%}%>
        <tr>
            <td width="17%">&nbsp;</td>
            <td width="8%">&nbsp;</td>
            <td width="14%">&nbsp;</td>
            
            
           
        </tr>
        <tr>

            <td  colspan="2" align="right">Total = </td>
            <td><%=grandTotal%>
                <input name="grandTotal"  value="<%=grandTotal%>"  type="hidden" class="formtxtstyle" />

        </tr>
        <tr>
            <td width="17%">&nbsp;</td>
            <td width="8%">&nbsp;</td>
            <td width="14%">&nbsp;</td>
           
           
        </tr>
        
        
  


    </table>
</form>

  <!----------------------------------------------------------------------------third form closed here------------------------------------->
</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>





