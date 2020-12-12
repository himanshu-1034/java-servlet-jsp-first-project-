<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%

String email=session.getAttribute("email").toString();
String subject = request.getParameter("subject");
String body = request.getParameter("description");
try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into message values(messageidseq.nextval,?,?,?)");
	ps.setString(1, email);
	ps.setString(2, subject);
	ps.setString(3, body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
	
}catch(Exception e){e.printStackTrace();


response.sendRedirect("messageUs.jsp?msg=invalid");
}

%>