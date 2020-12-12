<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String id = request.getParameter("id");
String status = "cancelled";

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where product_id like '%"+id+"%' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
	
	
}catch(Exception e){e.printStackTrace();
response.sendRedirect("ordersReceived.jsp?msg=invalid");
}


%>
