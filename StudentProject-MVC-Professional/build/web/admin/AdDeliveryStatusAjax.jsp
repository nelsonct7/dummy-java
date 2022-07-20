<%-- 
    Document   : index
    Created on : Oct 05, 2016, 05:15:23 PM
    Author     : BINI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="com.laundrymgt.dao.OrderDAO"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <%  
            String omid=request.getParameter("val");  
			
            if(omid==null || omid.trim().equals("")){  
                out.print("Please enter Order No#");  
            }
           else{  
                int omids=Integer.parseInt(omid);  
               
				String _status=OrderDAO.retStatus(omids);
			//	float _paid=OrderDAO.retPaid(omids);
				//float _dues=_total-_paid;
				
                    //     out.print("Total = "+_total+"     |       Paid = "+_paid+"     |        Dues = "+_dues);
					out.print(_status);
					 
              }  
			  
      %>  
    </body>
</html>
