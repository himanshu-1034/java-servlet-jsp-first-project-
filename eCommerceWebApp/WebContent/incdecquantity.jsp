<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String email = session.getAttribute("email").toString();
String operation = request.getParameter("op");
int price=0;
int total = 0;
int quantity=0;
int finaltotal = 0;

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and product_id like '%"+id+"%' and address is NULL");
	while(rs.next()){
		
		price = Integer.parseInt(rs.getString(4));
		total = Integer.parseInt(rs.getString(5));
		quantity = Integer.parseInt(rs.getString(3));
		
	}
	if(quantity==1 && "minus".equals(operation)){
		response.sendRedirect("myCart.jsp?msg=notpossible");
	}else if(quantity!=1 && "minus".equals(operation)){
		total-=price;
		quantity-=1;
		st.executeUpdate("update cart set total='"+Integer.toString(total)+"',quantity='"+Integer.toString(quantity)+"' where email='"+email+"' and product_id like '%"+id+"%' and address is NULL");
		response.sendRedirect("myCart.jsp?msg=dec");
		
		
	}
	else{
		total+=price;
		quantity+=1;
		st.executeUpdate("update cart set total='"+Integer.toString(total)+"',quantity='"+Integer.toString(quantity)+"' where email='"+email+"' and product_id like '%"+id+"%' and address is NULL");
		response.sendRedirect("myCart.jsp?msg=inc");
		
		
	}
	
	
}catch(Exception e){
	
	e.printStackTrace();
}


%>