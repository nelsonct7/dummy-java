
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>::. Laundry Management - Sign In .::</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />


<%
	String v=request.getParameter("v");
	System.out.println(v);
	
	
	
	String caption="";
	
	if(v==null){
		caption="";
	}
	else if(v.equals("1")){
		caption="Invalid Username or Password";
	}
	

%>


<!-- javascript validation starts -->
<script language="javascript">
function validateForm()
{
        if(document.login.uname.value=="")
        {
                alert("Enter Username");
				document.login.uname.focus();
				return false;
		}
		if(document.login.pass.value=="")
        {
                alert("Enter Password");
				document.login.pass.focus();
				return false;
		}
document.login.submit();
}
function hideCaption()
{
	document.form.capt.value="";
}

</script>
<!-- javascript validation ends-->

<style type="text/css">
<!--
.style2 {color: #0099FF}
.style4 {color: #3366CC}
.style5 {color: #3399ff}
.style7 {color: #55A0FF}
-->
</style>
</head>

<body>
<span class="style7"></span>
<div class="container">

<div class="header">
<div class="logo"><span class="style5"></span><!--<img src="images/logo.png" width="456" height="103"/>-->  </div>
</div>

<div class="header">

<div class="login_outer"  onclick="hideCaption();" >
<div class="login_box"><span class="style2"></span>

<h1>Sign In</h1>
<form id="login" name="login" method="post" action="loginAction.jsp" >
<table width="500" border="0" cellspacing="6" cellpadding="6">
  <tr>
    <td>Username</td>
    <td><span class="style4"></span>
      <label for="textfield"></label>
      <input type="text" name="uname" id="uname"  class="txt_01" value="" placeholder="Enter Username. "  tabindex="1" required/>   </td>
  </tr>
  <tr>
    <td>Password</td>
    <td><input type="password" name="pass" id="pass" class="txt_01" value="" placeholder="Enter Password. "  tabindex="2" required/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Submit" class="sbt_01" onclick="return validateForm();"/>  </td>
  </tr>
   <tr>
   
    <td colspan="2">
      		   <input type="text" name="capt" value="<%=caption%>" size="40"  class="aler_text" readOnly="true" />

    </td>
  </tr>
</table>
</form>
</div>
</div>
<div class="clear"></div>
</div>
<div>Copyright <a href="www.#.com"> Laundry Management </a></div>
</body>
</html>
