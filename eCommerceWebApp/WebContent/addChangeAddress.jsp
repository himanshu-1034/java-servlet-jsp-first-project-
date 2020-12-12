<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){

%>

<h3 class="alert">Address Successfully Updated !</h3>
<%}else if("notdone".equals(msg)){ %>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>

<form action="addchangeaddressaction.jsp" method="post">
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next()){
%>
<h3>Enter Address</h3>
 <input type="text" name="address" class="input-style" value="<%=rs.getString(7) %>" required placeholder="New Address">
 <hr>
 <h3>Enter city</h3>
 <input type="text" name="city" class="input-style" value="<%=rs.getString(8) %>" required placeholder="New city">
<hr>
<h3>Enter State</h3>
<input type="text" name="state" class="input-style" required value="<%=rs.getString(9) %>" placeholder="New state">
<hr>
<h3>Enter country</h3>
<input type="text" name="country" class="input-style" required value="<%=rs.getString(10) %>" placeholder="New Country">
<hr>
 <button class="button" type="submit">Change Address <i class='far fa-arrow-alt-circle-right'></i></button>
 <%}
}catch(Exception e){
	e.printStackTrace();
}
 %>
</form>
</body>
<br><br><br>
</html>