<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%

String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");
String id = request.getParameter("id");

try{
	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update product set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	if(active.equalsIgnoreCase("NO")){
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
}catch(Exception ex){
	
	ex.printStackTrace();
	response.sendRedirect("allProductEditProduct.jsp?msg=notdone");	
}


%>