<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
 <form action="editProductaction.jsp" method="post">
<% 
String ids = (String)(request.getParameter("id"));
String nam = request.getParameter("nm");
String categ = request.getParameter("ct");
System.out.println(ids);
int z=0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rr= st.executeQuery("select * from product where id like '%"+ids+"%'");	
	System.out.println("Connection part starts");
	while(rr.next()){
		z=1;
		System.out.println("Resultset part starts");
// select * from product where name='"+nam+"' and category='"+categ+"'
%>
<input type="hidden" name="id" value="<%=rr.getString(1)%>">
<div class="left-div">
 <h3> Name</h3>
	<input class="input-style" type="text" name="name" value="<%=rr.getString(2) %>" required>
<hr>
</div>
<div class="right-div">
<h3> Category</h3>
 <input class="input-style" type="text" name="category" value="<%=rr.getString(3) %>" required>
<hr>
</div>
<div class="left-div">
<h3> Price(in INR)</h3>
 <input type="number" class="input-style" name="price" value="<%=rr.getString(4) %>" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active" required>
<option value="YES">YES</option>
<option value="NO">NO</option>
</select>
 <hr>
</div>
 <button class="button" type="submit"><i class='far fa-arrow-alt-circle-right'></i> Update Info</button>
</form>
<%}
	}catch(Exception e){
		e.printStackTrace();
	}%>
	
</body>
</html>