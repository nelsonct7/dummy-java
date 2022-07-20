
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
<script>
function valForm()
{
       
		if(document.form.quant.value=="")
        {
                alert("Enter Quantity");
				document.form.quant.focus();
				return false;
		}
		
		if(isNaN(document.form.quant.value))
        {
             alert("Enter valid Quantity");
             document.form.quant.focus();
             return false;
        }
		
		if(document.form.itprice.value=="")
        {
                alert("Enter Price");
				document.form.itprice.focus();
				return false;
		}
		if(isNaN(document.form.itprice.value))
        {
             alert("Enter valid Price");
             document.form.itprice.focus();
             return false;
        }		
				
			
	document.form.submit();
}

</script>



<div class="login_outer" onClick="hideCaption();">
<div class="cnt">

<%
int oid=Integer.parseInt(request.getParameter("id"));
Order ord=OrderDAO.retOrderItem(oid);
%>
<form id="form" name="form" method="post" action="AdOrderVEDEditItemAction.jsp?id=<%=oid%>">
<h1>Edit Items</h1>

	<table width="628" border="0" cellspacing="6" cellpadding="6">
  
  <tr>
    <td>Item Name</td>
    <td>
      <label for="text"></label>
      <input name="item" type="text" class="txt_01" id="item" value="<%=ord.getItemname()%>" readonly="readonly"/>
    </td>
  </tr>
  
  <tr>
    <td>Quantity</td>
    <td>
      <label for="text"></label>
      <input name="quant" type="text" class="txt_01" id="quant" value="<%=ord.getOsquantity()%>" />
    </td>
  </tr>
  <tr>
    <td>Price</td>
    <td>
      <label for="text"></label>
      <input name="itprice" type="text" class="txt_01" id="itprice" value="<%=ord.getOsprice()%>"  />
    </td>
    
  </tr>
 
  
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Edit" class="sbt_01"  onClick="return valForm();"/>
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

