
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Bill"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.BillDAO"%>  <%-- Step 1: import package  business() class--%>
<%@ include file="AHeader.jsp" %>


<script>
function valForm()
{
       
		if(document.form.bdate.value=="")
        {
                alert("Enter Date");
				document.form.bdate.focus();
				return false;
		}
		
		if(document.form.paid.value=="")
        {
                alert("Enter Price");
				document.form.paid.focus();
				return false;
		}
		if(isNaN(document.form.paid.value))
        {
             alert("Enter valid Amount");
             document.form.paid.focus();
             return false;
        }
		
				
				
			
	document.form.submit();
}

</script>



<%
int id=Integer.parseInt(request.getParameter("id"));
Bill bill=BillDAO.retBill(id);
%>



<div class="login_outer" onClick="hideCaption();">
<div class="cnt">
<h1>BILL -EDIT </h1>

<form id="form" name="form" method="post" action="AdBillVEDEditAction.jsp?id=<%=id%>">

<table width="628" border="0" cellspacing="6" cellpadding="6">


 <tr>
    <td >Order Id</td>
    <td width="329">
      <label for="textfield"></label>
      <input name="omid" type="text" class="txt_01" id="omid" value="<%=bill.getOmid()%>" readonly="readonly"/>
    </td>
  </tr>

  
  <tr>
    <td>Billing Date</td>
    <td>
      <label for="text"></label>
      <input name="bdate" type="date" class="txt_01" id="bdate" value="<%=bill.getBdate()%>" />
    </td>
  </tr>
  
  <tr>
    <td>Paid Amount</td>
    <td>
      <label for="text"></label>
      <input name="paid" type="text" class="txt_01" id="paid" value="<%=bill.getPaid()%>" />
    </td>
  </tr>
  
  
  
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Edit" class="sbt_01" onClick="return valForm();"/>
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
