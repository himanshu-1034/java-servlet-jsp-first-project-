<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String securityquestion = request.getParameter("securityquestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = "";
String city= "";
String state = "";
String country = ""; 

try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobilenumber);
	ps.setString(4, securityquestion);
	ps.setString(5, answer);
	ps.setString(6, password);
	ps.setString(7, address);
	ps.setString(8, city);
	ps.setString(9, state);
	ps.setString(10, country);
	
	ps.executeUpdate();
	System.out.print("updated");
	response.sendRedirect("signup.jsp?msg=valid");
	
}catch(Exception e){e.printStackTrace();

response.sendRedirect("signup.jsp?msg=invalid");
}
%>