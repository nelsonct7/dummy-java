
<%@ include file="AHeader.jsp" %>
<%@page language="java" import="java.sql.*,java.util.*" %>
 <%-- Step 1: import package  business() class--%>
<%@page import="com.laundrymgt.dao.ItemDAO"%>  <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.beans.Item"%>  <%-- Step 1: import package getter/setter class--%>



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





<div class="login_outer" onClick="hideCaption();">
<div class="cnt">
<h1>ITEMS</h1>

  <table width="711" border="1" align="center">
<tr>
	<td width="59"><span style="font-size: 14">Sl.No</span></td>
	<td width="81"><span style="font-size: 14">Item</span></td>	
	<td width="81"><span style="font-size: 14">Price</span></td>	
    
	<td width="17"><span style="font-size: 14"></span></td>
	<td width="19"><span style="font-size: 14"></span></td>
	
</tr>

  
	<%
			int i=1;
			Item item=new Item();
	  		
			ArrayList<Item> ite=ItemDAO.listItems();
			for(Item it : ite){
                    
						
	  
	  %>

   <tr>
	<td width="61" height="20"><span style="font-size: 14"><%=i%></span></td>
	<td width="83"><div align="center"><span style="font-size: 14"><%=it.getItemname()%></span></div></td>
	<td width="83"><div align="center"><span style="font-size: 14"><%=it.getItemprice()%></span></div></td>
    
<td width="83"><div class="pr_edit"><a href="AdItemVEDEdit.jsp?id=<%=it.getItemid()%>&t=e&v=0" >Edit</a></div></td>
<td width="85"><div class="pr_edit"><a href="AdItemVEDEdit.jsp?id=<%=it.getItemid()%>&t=d&v=0" >Delete</a></div></td>
	</tr>
	
	
<%
i++;
}
%>

 
  
</table>


<table>
 <tr>
    <td>&nbsp;</td>
    <td>
      		   <input type="text" name="capt" value="<%=caption%>" size="40"  class="aler_text" readOnly="true" />

    </td>
  </tr>
</table>


</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>

