
<%@ include file="AHeader.jsp" %>

<%
	String v=request.getParameter("v");
	System.out.println(v);
	
	String caption="";
	
	if(v.equals("0")){
		caption="";
	}
	else if(v.equals("1")){
		caption="Already Exist!!! Please check..";
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
       
		if(document.form.ctype.value=="")
        {
                alert("select a category");
				document.form.ctype.focus();
				return false;
		}
		
		if(document.form.cname.value=="")
        {
                alert("Enter Name");
				document.form.cname.focus();
				return false;
		}		
		if(document.form.caddress.value=="")
        {
                alert("Enter Address");
				document.form.caddress.focus();
				return false;
		}		
		if(document.form.mobile.value=="")
        {
                alert("Enter Mobile Number");
				document.form.mobile.focus();
				return false;
		}
		if(isNaN(document.form.mobile.value)){
				alert("Enter Valid Mobile Number");
				document.form.mobile.focus();
				return false;
		}
		if(document.form.cemail.value=="")
        {
                alert("Please Enter Email");
				document.form.cemail.focus();
				return false;
		}
		 var x=document.form.cemail.value;
                var atposition=x.indexOf("@");
                var dotposition=x.lastIndexOf(".");
                if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){
                    alert("Please enter a valid e-mail address ");
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
<h1>Customer Entry</h1>

<form id="form" name="form" method="post" action="AdCustomerAddAction.jsp">

<table width="666" border="0" cellspacing="6" cellpadding="6">
  
 

  <tr>
    <td width="111">Type </td>
    <td width="513">
      <label for="textfield"></label>
     <select name="ctype">
     <option value="Individual">Individual</option>
     <option value="Hotel">Hotel</option>
     </select>
    </td>
  </tr>
  
  
   <tr>
    <td>Customer Name</td>
    <td>
      <label for="textfield"></label>
      <input name="cname" type="text" class="txt_01" id="cname" />
    </td>
  </tr>
 
  
  
  
  
  <tr>
    <td>Address</td>
    <td><textarea cols="50" rows="3" name="caddress"></textarea></td>
  </tr>
  
  
  
  
  
  <tr>
    <td>Mobile</td>
    <td><input type="text" name="mobile" /></td>
  </tr>
 
  
  
  
  
  <tr>
    <td>E mail</td>
    <td><input type="email" name="cemail" /></td>
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
