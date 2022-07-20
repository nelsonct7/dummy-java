
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Item"%> <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.dao.ItemDAO"%>  <%-- Step 1: import package  business() class--%>
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
	
      	
		if(document.form.inamae.value=="")
        {
                alert("Enter a name");
				document.form.inamae.focus();
				return false;
		}	
		if(document.form.iprice.value=="")
        {
                alert("Enter price");
				document.form.iprice.focus();
				return false;
		}
                 if(isNaN(document.form.iprice.value)){
				alert("Enter Valid Item Price");
				document.form.iprice.focus();
				return false;
		}
		
	
	var vid=document.form.id.value;
	
	
	document.form.action="AdItemVEDEditAction.jsp?id="+vid;	
	document.form.submit();
}
function deleteData()
{
	var vid=document.form.id.value;
	
	document.form.action="AdItemVEDDeleteAction.jsp?id="+vid;	
	document.form.submit();
}

</script>





<div class="login_outer" onClick="hideCaption();">.
<div class="cnt">
<h1>ORDER DETAILS</h1>

<form id="form" name="form" method="post" action="AdItemVEDEditAction.jsp" >

<table width="628" border="0" cellspacing="6" cellpadding="6">
<%
if(t.equals("e")){
Item item=new Item();
	item.setItemid(id1); //Step 3: setting values from jsp to setter/getter class
	  		System.out.println("am in item.....");
			ArrayList<Item> ite=ItemDAO.getItemDetails(item);
			for(Item it : ite){
%>

 <tr>
    <td width="2"></td>
    <td width="329">
      <label for="textfield"></label>
      <input name="id" type="hidden" class="txt_01" id="id" value="<%=it.getItemid()%>" />
    </td>
  </tr>

  
  <tr>
    <td>Item Name</td>
    <td>
      <label for="text"></label>
      <input name="iname" type="text" class="txt_01" id="iname" value="<%=it.getItemname()%>" />
    </td>
  </tr>
  
  <tr>
    <td>Item Price</td>
    <td>
      <label for="text"></label>
      <input name="iprice" type="text" class="txt_01" id="iprice" value="<%=it.getItemprice()%>" />
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
	Item item=new Item();
	item.setItemid(id1); //Step 3: setting values from jsp to setter/getter class
	  		
			ArrayList<Item> ite=ItemDAO.getItemDetails(item);
			for(Item it : ite){

%>
 <tr>
    <td width="2"></td>
    <td width="329">
      <label for="textfield"></label>
      <input name="id" type="hidden" class="txt_01" id="id" value="<%=it.getItemid()%>" />
    </td>
  </tr>

   <tr>
    <td>Item Name</td>
    <td>
      <label for="text"></label>
      <input name="iname" type="text" class="txt_01" id="iname" value="<%=it.getItemname()%>" />
    </td>
  </tr>
  
  <tr>
    <td>Item Price</td>
    <td>
      <label for="text"></label>
      <input name="iprice" type="text" class="txt_01" id="iprice" value="<%=it.getItemprice()%>" />
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
