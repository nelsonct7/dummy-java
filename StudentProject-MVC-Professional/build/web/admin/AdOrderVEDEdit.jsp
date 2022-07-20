
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
<script language="javascript">

function valForm()
{
       
		
		
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




<div class="login_outer" onClick="hideCaption();">
<div class="cnt">

<%
        
int oid=Integer.parseInt(request.getParameter("id"));
Order ord=OrderDAO.retCustomerOrder(oid);


%>
<form id="form" name="form" method="post" action="AdOrderVEDEditAction.jsp?id=<%=oid%>">
<h1>ORDERS</h1>

	<table width="628" border="0" cellspacing="6" cellpadding="6">


 <tr>
    <td >Order Id</td>
    <td width="329">
      <label for="textfield"></label>
      <input name="omid" type="text" class="txt_01" id="omid" value="<%=ord.getOmid()%>" readonly="readonly"/>
    </td>
  </tr>

  
  <tr>
    <td>Customer</td>
    <td>
     
     <!-- <select name="cid">
     <option><%=ord.getCname()%></option>
     
     </select>-->
       <input name="cust" type="text" class="txt_01" id="cust" value="<%=ord.getCname()%>" readonly="readonly"/>
    </td>
  </tr>
  
  <tr>
    <td>Order Date</td>
    <td>
      <label for="text"></label>
      <input name="odate" type="date" class="txt_01" id="odate" value="<%=ord.getOmdate()%>" />
    </td>
  </tr>
 
 
  <tr>
    <td>Order Time</td>
    <td>
      <label for="text"></label>
      <input name="otime" type="time" class="txt_01" id="otime" value="<%=ord.getOmtime()%>" />
    </td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Edit" class="sbt_01"   onClick="return valForm();"/>
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

