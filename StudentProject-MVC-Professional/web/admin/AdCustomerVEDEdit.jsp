
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Customer"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.CustomerDAO"%>  <%-- Step 1: import package  business() class--%>
<%@ include file="AHeader.jsp" %>






<%

String t=request.getParameter("t");
System.out.println("t------------"+t);
String id=request.getParameter("id");
int id1=Integer.parseInt(id);

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
                alert("Enter Mobil Number");
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
	
		
	var vid=document.form.id.value;
	
	document.form.action="AdCustomerVEDEditAction.jsp?id="+vid;	
	document.form.submit();
}
function deleteData()
{
	var vid=document.form.id.value;
	//alert(vid);
	document.form.action="AdCustomerVEDDeleteAction.jsp?id="+vid;	
	document.form.submit();
}


function hideCaption()
{
	document.form.capt.value="";
}
</script>



<div class="login_outer" onClick="hideCaption();">
<div class="cnt">
<h1>CUSTOMER -EDIT </h1>

<form id="form" name="form" method="post" action="AdCustomerVEDEditAction.jsp">

<table width="628" border="0" cellspacing="6" cellpadding="6">

<%
if(t.equals("e")){
 	

	Customer customer=new Customer();
	customer.setCid(id1); //Step 3: setting values from jsp to setter/getter class
	  		
			ArrayList<Customer>cus =CustomerDAO.getCustomerDetails(customer);
			for(Customer cu : cus){

        String type=cu.getCtype();


%>
 <tr>
    <td width="2"></td>
    <td width="329">
      <label for="textfield"></label>
      <input name="id" type="hidden" class="txt_01" id="id" value="<%=cu.getCid()%>" />
    </td>
  </tr>

  
  <tr>
    <td>Type</td>
    <td>
      <label for="text"></label>
      <select name="ctype">
      <% 
	/*  if(type.equals("Individual")){
		  out.println("Individual");
          }
	  else{
		  out.println("Hotel");
	  }
	*/
	if(type.equals("Individual")){
		%>
      <!--  <option>Individual</option>-->
       <option selected="selected" value="<%=type%>"><%=type%></option>
          <option value="Hotel">Hotel</option>
        
	  <%
	     }
	  else{
		  %>
		<!-- <option>Hotel</option>-->
         <option selected="selected" value="<%=type%>"><%=type%></option>
          <option value="Individual">Individual</option>
         <%
	  }
	  %>
	  </select>

    </td>
  </tr>
  
  <tr>
    <td>Custmer Name</td>
    <td>
      <label for="text"></label>
      <input name="cname" type="text" class="txt_01" id="cname" value="<%=cu.getCname()%>" />
    </td>
  </tr>
   <tr>
    <td>Address</td>
    <td>
      <label for="text"></label>
      <textarea  cols="50" rows="3" name="caddress"><%=cu.getCaddress()%></textarea>
    </td>
  </tr>
  <tr>
    <td>Mobile</td>
    <td>
      <label for="text"></label>
      <input name="mobile" type="text" class="txt_01" id="mobile" value="<%=cu.getMobile()%>" />
    </td>
  </tr>
   <tr>
    <td>E Mail</td>
    <td>
      <label for="text"></label>
      <input name="cemail" type="email" class="txt_01" id="cemail" value="<%=cu.getCemail()%>" />
    </td>
  </tr>
  
  
  
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Edit" class="sbt_01" onClick=" return valForm();"/>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 
  <%}}
  else if(t.equals("d")){
	Customer customer=new Customer();
	customer.setCid(id1); //Step 3: setting values from jsp to setter/getter class
	  		
			ArrayList<Customer> cus=CustomerDAO.getCustomerDetails(customer);
			for(Customer cu : cus){

                        String type=cu.getCtype();
%>
  <tr>
    <td width="2"></td>
    <td width="329">
      <label for="textfield"></label>
      <input name="id" type="hidden" class="txt_01" id="id" value="<%=cu.getCid()%>" />
    </td>
  </tr>

   <tr>
    <td>Type</td>
    <td>
      <label for="text"></label>
      <select name="ctype">
      <% 
	/*  if(type.equals("Individual")){
		  out.println("Individual");
          }
	  else{
		  out.println("Hotel");
	  }
	*/
	if(type.equals("Individual")){
		%>
      <!--  <option>Individual</option>-->
       <option selected="selected" value="<%=type%>"><%=type%></option>
          <option value="Hotel">Hotel</option>
        
	  <%
	     }
	  else{
		  %>
		<!-- <option>Hotel</option>-->
         <option selected="selected" value="<%=type%>"><%=type%></option>
          <option value="Individual">Individual</option>
         <%
	  }
	  %>
    </td>
  </tr>
  
   <tr>
    <td>Custmer Name</td>
    <td>
      <label for="text"></label>
      <input name="cname" type="text" class="txt_01" id="cname" value="<%=cu.getCname()%>" />
    </td>
  </tr>
  
 <tr>
    <td>Address</td>
    <td>
      <label for="text"></label>
      <textarea cols="50" rows="3" name="caddress" ><%=cu.getCaddress()%></textarea>
    </td>
  </tr>
  
  <tr>
    <td>Mobile</td>
    <td>
      <label for="text"></label>
      <input name="mobile" type="text" class="txt_01" id="mobile" value="<%=cu.getMobile()%>" />
    </td>
  </tr>
  
   <tr>
    <td>E Mail</td>
    <td>
      <label for="text"></label>
      <input name="cemail" type="email" class="txt_01" id="cemail" value="<%=cu.getCemail()%>" />
    </td>
  </tr>
  
   
 
<%}%>

  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Delete" class="sbt_01" onClick=" return deleteData();"/>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
  <%}%>
  
 
  
  
  
  </table>

</form>





</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>
