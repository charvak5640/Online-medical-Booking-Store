<link href="cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
String[] users=request.getParameterValues("user");
if(session.getValue("login")==null) response.sendRedirect("cyber.jsp?invalid");	
try	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:cyber","cyber","cyber");
	Statement stmt=con.createStatement();
	for(int i=0;i<users.length;i++) stmt.executeUpdate("delete from cyber_signup where user_name='"+users[i]+"'");
	response.sendRedirect("deleteuser.jsp");
} catch(Exception e) {
		out.println("<center><h2>Failed To Delete Items Due to The Error <BR>"+e);
}
%>
<center><h4><a href="javascript:history.back()">Continue</a></h4>

