
<%@ include file="AHeader.jsp" %>
<%@page language="java" import="java.sql.*,java.util.*" %>
 <%-- Step 1: import package  business() class--%>
<%@page import="com.laundrymgt.dao.OrderDAO"%>  <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.beans.Order"%>  <%-- Step 1: import package getter/setter class--%>



<%
	String v=request.getParameter("v");
	System.out.println(v);
	
	String caption="";
	
	if(v.equals("0")){
		caption="";
	}
	else if(v.equals("1")){
		caption="Exist!!!";
	}
	else if(v.equals("2")){
		caption="Inserted...";
	}
	else if(v.equals("3")){
		caption="OOPS !!! Failure. Please insert again...";
	}
	else if(v.equals("4")){
		caption="Updated...";
	}
	else if(v.equals("5")){
		caption="Deleted...";
	}

%>





<div class="login_outer" onClick="hideCaption();">
<div class="cnt">
<h1>ORDERS</h1>

  <table border="1" align="center">
<tr>
	<td width="61"><span style="font-size: 14">Order Id</span></td>	
	<td width="133"><span style="font-size: 14">Customer</span></td>	
	<td width="83"><span style="font-size: 14">Order Date</span></td>
	<td width="83"><span style="font-size: 14">Edit</span></td>
	<td width="83"><span style="font-size: 14">Delete</span></td>
</tr>
 
	<%
			int i=1;
			Order order=new Order();
	  		
			ArrayList<Order> orders=OrderDAO.retCustomerOrders();
			for(Order ord : orders){
                              int o_id=ord.getOmid();
						
	  
	  %>

   <tr>
	<td width="61"><div align="center"><span style="font-size: 14"><%=ord.getOmid()%></span></div></td>
	<td width="133"><div align="center"><span style="font-size: 14"><%=ord.getCname()%></span></div></td>
	<td width="83"><div align="center"><span style="font-size: 14"><%=ord.getOmdate()%></span></div></td> 
    <td width="83"><div class="pr_edit"><a href="AdOrderVEDEdit.jsp?id=<%=ord.getOmid()%>&t=e&v=0" >Edit</a></div></td>
    <td width="85"><div class="pr_edit"><a href="AdOrderVEDDeleteAction.jsp?id=<%=ord.getOmid()%>&t=d&v=0" >Delete</a></div></td>
</tr>
<tr>
 <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>	
<table width="133" border="1" align="center">
<tr>
    <td width="13"><span style="font-size: 14">Sl.No</span></td>
	<td width="40"><span style="font-size: 14">Item</span></td>	
	<td width="40"><span style="font-size: 14">Quantity</span></td>	
    <td width="40"><span style="font-size: 14">Price</span></td>
    <td width="40"><span style="font-size: 14">Edit</span></td>
	<td width="40"><span style="font-size: 14">Delete</span></td>
 </tr>


	<%  	
	int j=1;
			ArrayList<Order> or=OrderDAO.retOrderItems(ord);
			for(Order o : or){					
	                  System.out.println("id="+o_id);
                        //  session.setAttribute("osid",ord.getOsid());
	  %>
 <tr>
    <td width="61"><div align="center"><span style="font-size: 14"><%=j%></span></div></td>
    <td width="61"><div align="center"><span style="font-size: 14"><%=o.getItemname()%></span></div></td>
    <td width="61"><div align="center"><span style="font-size: 14"><%=o.getOsquantity()%></span></div></td>
    <td width="61"><div align="center"><span style="font-size: 14"><%=o.getTotal()%></span></div></td>
     <td width="83"><div class="pr_edit"><a href="AdOrderVEDEditItem.jsp?id=<%=o.getOsid()%>&t=e&v=0" >Edit</a></div></td>
    <td width="85"><div class="pr_edit"><a href="AdOrderVEDDeleteItemAction.jsp?id=<%=o.getOsid()%>&t=d&v=0" >Delete</a></div></td>
 </tr>
  <%j++;
  } %>
</table>
</td>
 <td>&nbsp;</td>
  <td>&nbsp;</td>

</tr>	
<%
i++;
}
%>

</table>
<table>
 <tr>
    <td>&nbsp;</td>
    <td>
      		   <input type="text" name="capt" value="<%=caption%>" size="40"  class="aler_text" readOnly="true" />

    </td>
  </tr>
</table>


</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>

