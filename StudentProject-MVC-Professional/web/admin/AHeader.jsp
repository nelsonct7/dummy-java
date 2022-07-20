


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>::. Laundry Management - Admin Page .::</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu-v.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<script type="text/javascript" src="calendarDateInput.js">
</script>



<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "smoothmenu1", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	//customtheme: ["#804000", "#482400"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
<script language="javascript">
	document.onmousedown=disableclick;
	status="Welcome to Laundry Manager";
	function disableclick(event)
	{
	  if(event.button==2)
	   {
		 alert(status);
		 return false;    
	   }
	}
</script>


 <script type = "text/javascript" >
   function preventBack()
   {
       window.history.forward();
   }
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
</head>

<body>

<div class="container">

<div class="header">
<div class="logo"><span class="style5"></span><!--<img src="images/logo.png" width="456" height="103"/> --> </div>
  
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
      <%
        String uname=(String)session.getAttribute("username");
      %>
                    <td align="left"><font size="4" align="left" face="arial" color="yellow">  Welcome <%=uname%></font></td>   
  </tr>
</table>
</div>

<div class="menu_cntr">

<div id="smoothmenu1" class="ddsmoothmenu">
<ul>

<li><a href="AHome.jsp">Homepage</a></li>

<li><a href="#">Master Settings</a>
  <ul> 
  <li><a href="AdChangePassword.jsp?v=0">Change Password</a></li>   
  </ul>
</li>

<li><a href="#">Back End</a>
	  <ul> 
		  <li><a href="#">Item</a>
				<ul> 
					<li><a href="AdItemtAdd.jsp?v=0">Add</a></li>  
					<li><a href="AdItemVED.jsp?v=0">View/Edit/Delete</a></li>    
			    </ul>
		  </li>
           <li><a href="#">Customer</a>
				<ul> 
					<li><a href="AdCustomerAdd.jsp?v=0">Add</a></li>  
					<li><a href="AddCustomerVED.jsp?v=0">View/Edit/Delete</a></li>    
			    </ul>
		  </li>
		  
	  </ul>
</li>

<li><a href="#">Front End</a>
  <ul> 
   		<li><a href="#">Order Details</a>
				<ul> 
                	<li><a href="AddOrderMain.jsp?v=0">Add</a></li>  					 
					<li><a href="AdOrderVED.jsp?v=0">View/Edit/Delete</a></li>
			    </ul>
		</li>
		
		<li><a href="#">Bill</a>
				<ul> 					 
					<li><a href="AdBillAdd.jsp?v=0">Add</a></li>    
                    <li><a href="AdBillVED.jsp?v=0">View/Edit/Delete</a></li>
			    </ul>
		</li>
        
        <li><a href="AdDeliveryUpdate.jsp?v=0">Delivery Status Update</a>
				
		</li>
	</ul>
    </li>	
		
        <li><a href="#">Reports</a>
  <ul> 
   		<li><a href="AdReportOrder.jsp">Order[From-To]</a>
		</li>
        
       
		
		<li><a href="AdReportBill.jsp">Bill[From-To]</a>
			
		</li>
        
      
  </ul>
</li>
<li><a href="../Logout.jsp?v=0">Logout</a></li>
</ul>
<br style="clear: left" />
</div>
</div>