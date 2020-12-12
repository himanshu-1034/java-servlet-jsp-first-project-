<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change mobile number</title>
</head>
<body>
<%String msg = request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%}else if("wrong".equals(msg)){ %>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>


<form action="changemobilenumberaction.jsp" method="post">

 <h3>Enter Your New Mobile Number (Don't include Country code)</h3>
 <input name="mobilenumber" type="number" placeholder="Enter new number" required class="input-style">
 <hr>
<h3>Enter Password (For Security)</h3>
<input name="password" type="password" placeholder="Enter Your Password" required class="input-style">
<hr>
 <button class="button" type="submit">Update Number <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>