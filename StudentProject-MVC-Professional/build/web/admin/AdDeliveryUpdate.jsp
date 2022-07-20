
<%@page import="com.laundrymgt.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.laundrymgt.beans.Order"%>
<%@ include file="AHeader.jsp" %>

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
	var request;  
	function sendInfo()  {  
			var o=document.bform.ordid.value; 
			document.getElementById("oid").value = o;
			
			var url="AdDeliveryStatusAjax.jsp?val="+o;  
			  
			if(window.XMLHttpRequest){  
					request=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
					request=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
	  
			try{  
					request.onreadystatechange=getInfo;  
					request.open("GET",url,true);  
					request.send();  
			}
			catch(e){
					alert("Unable to connect to server");
			}  
	}  
		  
	function getInfo(){  
		if(request.readyState==4){  
			
			var val=request.responseText;  
		//	alert(val);
			document.getElementById('s1').innerHTML=val;  
		//	document.bill.total.value=val;
		
			
		}  
	}  
  
</script>  

<script>
function valForm()
{
       
		
		if(document.bill.sdate.value=="" || document.bill.sdate.value==null )
        {
                alert("Choose a date");
				document.bill.sdate.focus();
				return false;
		}
		document.form.submit();
}

</script>

<div class="login_outer" >
<div class="cnt">
<h1>DELIVERY STATUS  </h1>


<form name="bform">  
<table width="667">
<tr>
    <td width="164">Enter Order #</td>
    <td width="491">
      <label for="textfield"></label>
      <input name="ordid" type="text" class="txt_01" id="ordid" onkeyup="sendInfo()"/>
    </td>
    
  </tr>
  <tr>
  </tr>
  <tr>
    <td height="42">Current Status</td>
    <td>
      <span id="s1"> </span>  
    </td>
  </tr>
</table>
</form>


<form name="bill" method="post" action="AdDeliveryUpdateAction.jsp" >



    <table width="666" border="0" cellspacing="6" cellpadding="6">
 


 <tr>
    <td></td>
    <td>
      <label for="textfield"></label>
      <input name="oid" type="hidden" class="txt_01" id="oid" value="" />
    </td>
  </tr>


  <tr>
    <td> Date</td>
    <td>
      <label for="textfield"></label>
      <input name="sdate" type="date" class="txt_01" id="sdate" />
    </td>
  </tr>
  
  <tr>
    <td>Status</td>
    <td>
      <label for="textfield"></label>
      <input name="status" type="text" class="txt_01" id="status" value="Delivered" readonly="true"/>
    </td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
   <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button" id="button" value="Next" class="sbt_01" 
	  onClick="return valForm();"/>
    </td>
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