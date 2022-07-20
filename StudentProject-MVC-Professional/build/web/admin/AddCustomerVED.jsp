<%@ include file="AHeader.jsp" %>
<%@page language="java" import="java.sql.*,java.util.*" %>
 <%-- Step 1: import package  business() class--%>
<%@page import="com.laundrymgt.dao.CustomerDAO"%>  <%-- Step 1: import package getter/setter class--%>
<%@page import="com.laundrymgt.beans.Customer"%>  <%-- Step 1: import package getter/setter class--%>

<div class="login_outer" >
<div class="cnt">
<h1>ITEMS</h1>

  <table width="711" border="1" align="center">
<tr>
	<td width="59"><span style="font-size: 14">Sl.No</span></td>
	<td width="81"><span style="font-size: 14">Type</span></td>	
	<td width="81"><span style="font-size: 14">Name</span></td>
        <td width="81"><span style="font-size: 14">Address</span></td>
        <td width="81"><span style="font-size: 14">Mobile</span></td>
        <td width="81"><span style="font-size: 14">Email</span></td>
    
	<td width="17"><span style="font-size: 14"></span></td>
	<td width="19"><span style="font-size: 14"></span></td>
	
</tr>

  
	<%
			int i=1;
			Customer customer=new Customer();
	  		
			ArrayList<Customer> custom=CustomerDAO.listCustomer();
			for(Customer it : custom){
                    
						
	  
	  %>

   <tr>
	<td width="61" height="20"><span style="font-size: 14"><%=i%></span></td>
	<td width="83"><div align="center"><span style="font-size: 14"><%=it.getCtype()%></span></div></td>
	<td width="83"><div align="center"><span style="font-size: 14"><%=it.getCname()%></span></div></td>
        <td width="83"><div align="center"><span style="font-size: 14"><%=it.getCaddress()%></span></div></td>
        <td width="83"><div align="center"><span style="font-size: 14"><%=it.getMobile()%></span></div></td>
        <td width="83"><div align="center"><span style="font-size: 14"><%=it.getCemail()%></span></div></td>
    
<td width="83"><div class="pr_edit"><a href="AdCustomerVEDEdit.jsp?id=<%=it.getCid()%>&t=e" >Edit</a></div></td>
<td width="85"><div class="pr_edit"><a href="AdCustomerVEDEdit.jsp?id=<%=it.getCid()%>&t=d" >Delete</a></div></td>
	</tr>
	
	
<%
i++;
}
%>

</table>





</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>
