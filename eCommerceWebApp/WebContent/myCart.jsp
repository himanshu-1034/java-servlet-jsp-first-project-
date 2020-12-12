<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg = request.getParameter("msg"); 
if("notpossible".equals(msg)){	
	

%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%}else if("inc".equals(msg)){ %>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%}else if("dec".equals(msg)){ %>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%}else if("removed".equals(msg)){ %>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>
<%
	try{
		int total=0;
		int sno=0;
		
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
		while(rs1.next()){
			if(rs1.getString(1) == null)
				total=0;
			else
			    total = Integer.parseInt(rs1.getString(1));
		}
	
%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.print(total); %></th>
            <%if(total>0){ %>
            <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
            <%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs2 = st.executeQuery("select * from product inner join cart on product.price=cart.price and cart.email='"+email+"' and cart.address is NULL");
      while(rs2.next()){
    	  
      %>
          <tr>
			<%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs2.getString(2) %></td>
            <td><%=rs2.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(4) %></td>
            <td><a href="incdecquantity.jsp?id=<%=rs2.getString(7)%>&op=plus"><i class='fas fa-plus-circle'></i></a> <%=Integer.parseInt(rs2.getString(8)) %> <a href="incdecquantity.jsp?id=<%=rs2.getString(7)%>&op=minus"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(10) %></td>
            <td><a href="remove.jsp?id=<%=rs2.getString(7)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>

        </tbody>
        
        <%
      }
	}catch(Exception e){
		e.printStackTrace();
	}
        
        %>
      </table>
      <br>
      <br>
      <br>

</body>
</html>