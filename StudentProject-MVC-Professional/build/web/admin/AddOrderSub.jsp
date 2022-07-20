<%@page import="com.laundrymgt.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Order"%>

<%@ include file="AHeader.jsp" %>


<div class="login_outer" >
<div class="cnt">
<h1>Order Entry</h1>

<form method="post" action=".jsp" >
    <table width="666" border="0" cellspacing="6" cellpadding="6">
    <tr>
    <td width="111">ITEM </td>
    <td width="513">
      <label for="textfield"></label>
      <select name="cid">
     <option>---SELECT ONE--</option>
  
       <%

 	

	Order order=new Order();
	//order.setCid(id1); //Step 3: setting values from jsp to setter/getter class
	  		
			ArrayList<Order>ord =OrderDAO.retrieveItems(order);
                      
                     
			for(Order od : ord){
                           
                            
                            String cidname=od.getItemid()+"-"+od.getItemname();
                          //  System.out.println(cidname);
                       

%> 
        
 <option><%=cidname%></option>

     <%}%>
    
     </select>
    </td>
  </tr>

  <tr>
    <td>QUANTITY</td>
    <td>
      <label for="textfield"></label>
      <input name="quantity" type="text" class="txt_01" id="iname" />
    </td>
  </tr>
  
  <tr>
    <td>PRICE</td>
    <td>
      <label for="textfield"></label>
      <input name="price" type="text" class="txt_01" id="iname" />
    </td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
   <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="PLACE ORDER" class="sbt_01" 
	  onClick="return valForm();"/>
    </td>
  </tr>
  
    </table>
</form>
</div>
</div>