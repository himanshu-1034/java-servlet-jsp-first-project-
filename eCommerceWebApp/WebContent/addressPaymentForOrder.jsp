<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Home</title>
<script>
if(window.history.forward(1) != null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>

<%
String email = session.getAttribute("email").toString();

int total=0;
int sno=0;

try{
		
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
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
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
          </tr>
        </thead>
        <tbody>
         <%
      ResultSet rs2 = st.executeQuery("select * from product inner join cart on product.price=cart.price and cart.email='"+email+"' and cart.address is NULL");
      while(rs2.next()){
    	  
      %>
          <tr>
          <%sno+=1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs2.getString(2) %></td>
            <td><%=rs2.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(4) %></td>
            <td><%=rs2.getString(8) %> </td>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(10) %></td>
            </tr>
         <%} 
         
        
         %>
        </tbody>
      </table>
      <%
      ResultSet rs3 = st.executeQuery("select * from users where email='"+email+"'");
      while(rs3.next()){
    	  
      
      %>
<hr style="width: 100%">
<form action="addresspaymentfororderaction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs3.getString(7) %>" placeholder="Enter Address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs3.getString(8) %>" placeholder="Enter Your City" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs3.getString(9) %>" placeholder="Enter Your State" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs3.getString(10) %>" placeholder="Enter Country Name" required>
</div>
<h3 style="color: yellow">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: yellow">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select name="paymentmethod" class="input-style" required>
 	<option value="Cash On Delivery">Cash On Delivery</option>
 	<option value="Online Payment"> Online Payment</option>
 </select>
</div>

<div class="right-div">
<h3>Pay online on this himanshu.developer@icloud.com</h3>
<input class="input-style" type="text" name="transactionid" placeholder="Enter Transaction ID" required>
<h3 style="color: yellow">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="number" name="mobilenumber" value="<%=rs3.getString(3) %>" placeholder="Enter Mobile Number" required>
<h3 style="color: yellow">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order can get cancelled!</h3>
<button type="submit" class="button">Proceed To Generate Bill <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
      }
}catch(Exception e){
	e.printStackTrace();
}
%>

      <br>
      <br>
      <br>

</body>
</html>