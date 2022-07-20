
<%@ include file="AHeader.jsp" %>

<%
	String v=request.getParameter("v");
	
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
       
		if(document.form.ntitle.value=="")
        {
                alert("Enter News Title");
				document.form.ntitle.focus();
				return false;
		}
		
		if(document.form.ndesc.value=="")
        {
                alert("Enter News Description");
				document.form.ndesc.focus();
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
<h1>News & Events Entry</h1>

<form id="form" name="form" method="post" action="AdNewsEventsAddAction.jsp">

<table width="666" border="0" cellspacing="6" cellpadding="6">
  
 

  <tr>
    <td>News Title</td>
    <td>
      <label for="textfield"></label>
      <input name="ntitle" type="text" class="txt_01" id="ntitle" />
    </td>
  </tr>
  
  
  
  <tr>
    <td>Description</td>
    <td>
      <label for="textarea"></label>
      <textarea name="ndesc" id="ndesc" cols="45" rows="5" class="txt_03"></textarea>
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
