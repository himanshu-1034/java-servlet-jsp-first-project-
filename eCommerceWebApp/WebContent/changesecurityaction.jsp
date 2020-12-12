<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>


<%
String email = session.getAttribute("email").toString();
String password =request.getParameter("password");
String securityq = request.getParameter("securityquestion");
String answer = request.getParameter("answer");

int check=0;
try{
	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set securityquestion='"+securityq+"',answer='"+answer+"' where email='"+email+"' and password='"+password+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}
	
	if(check==0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=notdone");
	}
	
}catch(Exception e){e.printStackTrace();}
%>