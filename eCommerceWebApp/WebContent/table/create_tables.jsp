<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>


<%
	try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	String q1 = "create table users(name varchar2(100),email varchar2(100) primary key,mobilenumber varchar2(100),securityquestion varchar2(200),answer varchar2(200),password varchar2(100),address varchar2(500),city varchar2(100),state varchar2(100),country varchar2(100))";
	String q2 = "create table product(id varchar2(100),name varchar2(100),category varchar2(200),price varchar2(100),active varchar2(10))";
	String q3 = "create table cart(email varchar2(100),product_id varchar2(100),quantity varchar2(100),price varchar2(100),total varchar2(100),address varchar2(500),city varchar2(100),state varchar2(100),country varchar2(100),mobilenumber varchar2(100),orderdate varchar2(100),deliverydate varchar2(100),payment varchar2(100),transactionid varchar2(100),status varchar2(100))";
	String q4 = "create table message(id number(20) primary key,email varchar2(100),subject varchar2(100),body varchar2(500))";
	//System.out.print(q1);
	//System.out.println(q3);
	//System.out.print(q2);
	//System.out.print(q4);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	//st.execute(q4);
	//System.out.println("Table Created");
	con.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>