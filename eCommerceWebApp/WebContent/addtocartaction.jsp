<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

 <%
 String email = session.getAttribute("email").toString();
 String product_id = request.getParameter("id");
 int quantity=1;
 int product_price=0;
 int product_total = 0;
 int cart_total = 0;
 
 int z=0;
 try{
	 
	 Connection con = ConnectionProvider.getCon();
	 Statement st = con.createStatement();
	 ResultSet rs = st.executeQuery("select * from product where id like '%"+product_id+"%'");
	 while(rs.next()){
		 product_price = Integer.parseInt(rs.getString(4));
		 product_total = product_price;
		 
	 }
	 ResultSet rs1 = st.executeQuery("select * from cart where product_id like '%"+product_id+"%' and email='"+email+"' and address is NULL");
	 while(rs1.next()){
		 cart_total = Integer.parseInt(rs1.getString(5));
		 cart_total += product_total;
		 quantity = Integer.parseInt(rs1.getString(3));
		 quantity+=1;
		 z=1;
	 }
	 
	 if(z==1){
		 String ct = Integer.toString(cart_total);
		 st.executeUpdate("update cart set total='"+ct+"',quantity='"+Integer.toString(quantity)+"' where product_id like '%"+product_id+"%' and email='"+email+"' and address is NULL");
		 response.sendRedirect("home.jsp?msg=exist");
	 }
	 else if(z==0){
		 PreparedStatement ps = con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values (?,?,?,?,?)");
		 ps.setString(1, email);
		 ps.setString(2, product_id);
		 ps.setString(3, Integer.toString(quantity));
		 ps.setString(4, Integer.toString(product_price));
		 ps.setString(5, Integer.toString(product_total));
		 ps.executeUpdate();
		 response.sendRedirect("home.jsp?msg=added");
	 }
	 
 }catch(Exception e){
	 e.printStackTrace();
	 response.sendRedirect("home.jsp?msg=invalid");	 
 }
 %>