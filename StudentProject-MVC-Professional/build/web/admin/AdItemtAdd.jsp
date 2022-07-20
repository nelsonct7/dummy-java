
<%@ include file="AHeader.jsp" %>

<%
	String v=request.getParameter("v");
	System.out.println(v);
	
	String caption="";
	
	if(v.equals("0")){
		caption="";
	}
	else if(v.equals("1")){
		caption="Already Exist these item details!!! Please check.. ";
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
       
		if(document.form.iname.value=="")
                {
                 alert("Enter Item Name");
				document.form.iname.focus();
				return false;
		}
		
		if(document.form.iprice.value=="")
                {
                    alert("Enter Item Price");
				document.form.iprice.focus();
				return false;
		}
                if(isNaN(document.form.iprice.value)){
				alert("Enter Valid Item Price");
				document.form.iprice.focus();
				return false;
		}
		
	document.form.submit();
}
function hideCaption()
{
	document.form.capt.value="";
}
</script>


<div class="login_outer" onclick="hideCaption();">
<div class="cnt">
<h1>Items Entry</h1>

<form id="form" name="form" method="post" action="AdItemAddAction.jsp">

<table width="666" border="0" cellspacing="6" cellpadding="6">
  
 

  <tr>
    <td>Item Name</td>
    <td>
      <label for="textfield"></label>
      <input name="iname" type="text" class="txt_01" id="iname" />
    </td>
  </tr>
  
  
   <tr>
    <td>Item Price</td>
    <td>
      <label for="textfield"></label>
      <input name="iprice" type="text" class="txt_01" id="iprice" />
    </td>
  </tr>
 
  
  
  
  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
 
 
   <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Submit" class="sbt_01" 
	  onClick="return valForm();"/>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
  
   <tr>
    <td>&nbsp;</td>
    <td>
      		   <input type="text" name="capt" value="<%=caption%>" size="40"  class="aler_text" readOnly="true" />

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
