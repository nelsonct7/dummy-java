
<%@page import="com.laundrymgt.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Order"%>
<%@ include file="AHeader.jsp" %>


<script language="javascript">

function valForm()
{
       var cid=document.form.cid.value;
		if(cid=="---SELECT ONE--")
        {
                alert("Select a Customer");
				document.form.cid.focus();
				return false;
		}
		
		if(document.form.odate.value=="")
        {
                alert("Enter Date");
				document.form.odate.focus();
				return false;
		}		
		if(document.form.otime.value=="")
        {
                alert("Enter Time");
				document.form.otime.focus();
				return false;
		}		
			
	document.form.submit();
}

</script>

<div class="login_outer" >
<div class="cnt">
<h1>Order Entry</h1>

<form name="form" method="post" action="AddOrderMainAction.jsp" >
    <table width="666" border="0" cellspacing="6" cellpadding="6">
    <tr>
    <td width="111">Customer </td>
    <td width="513">
      <label for="textfield"></label>
     <select name="cid">
     <option>---SELECT ONE--</option>
  
       <%

 	

	Order order=new Order();
	//order.setCid(id1); //Step 3: setting values from jsp to setter/getter class
	  		
			ArrayList<Order>ord =OrderDAO.retrieveCustomer(order);
                      
                     
			for(Order od : ord){
                           
                            
                            String cidname=od.getCid()+"-"+od.getCname();
                          //  System.out.println(cidname);
                       

%> 
        
 <option><%=cidname%></option>

     <%}%>
    
     </select>
    </td>
  </tr>

  <tr>
    <td>Order Date</td>
    <td>
      <label for="textfield"></label>
      <input name="odate" type="date" class="txt_01" id="odate" />
    </td>
  </tr>
  
  <tr>
    <td>Order Time</td>
    <td>
      <label for="textfield"></label>
      <input name="otime" type="time" class="txt_01" id="otime" />
    </td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
   <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Next" class="sbt_01" 
	  onClick="return valForm();"/>
    </td>
  </tr>
  
    </table>
</form>
</div>
</div>