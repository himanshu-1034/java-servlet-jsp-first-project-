<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email=session.getAttribute("email").toString();
String password =request.getParameter("password");
String mobilenumber= request.getParameter("mobilenumber");
int c=0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs  = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next()){
		c=1;
		st.executeUpdate("update users set mobilenumber='"+mobilenumber+"' where email='"+email+"' and password='"+password+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(c==0){
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
	
}catch(Exception e)
{
	e.printStackTrace();}
%>