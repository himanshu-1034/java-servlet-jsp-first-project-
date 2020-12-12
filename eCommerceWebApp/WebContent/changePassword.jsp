<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("notmatch".equals(msg)){
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%}else if("wrong".equals(msg)){ %>
<h3 class="alert">Your old Password is wrong!</h3>
<%}else if("done".equals(msg)){ %>
<h3 class="alert">Password change successfully!</h3>
<%}else if("invalid".equals(msg)){ %>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<form action="changepasswordaction.jsp" method="post">
<h3>Enter Old Password</h3>
 <input type="text" class="input-style" name="oldpassword" required placeholder="Enter Old Password">
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="text" name="newpassword" required placeholder="Enter New Password">
 <hr>
<h3>Confirm Your New Password</h3>
<input class="input-style" type="text" name="confirmpassword" required placeholder="Confirm Your Password">
<hr>
 <button class="button" type="submit">Update Password <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>