<link href="cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%
try	{
String user=request.getParameter("user").trim();
String hintqus=request.getParameter("hint_question").trim();
String hintans=request.getParameter("hint_answer").trim();
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:cyber","cyber","cyber");
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select password from cyber_signup where user_name='"+user+"' and hint_question='"+hintqus+"' and hint_answer='"+hintans+"'");
	if(rs.next()==false) {
			out.println("<center><h2>Incorrect Details</h2>");
			out.println("<center><h4><a href=\"javascript:history.back()\">Continue</a></h4>");
			return;
	} else  out.println("<center><h2>Your's Password is :"+rs.getString("password"));
	}catch(Exception e)	{
	out.println("<center><h2>Failed To change Password Due to The Error "+e);
	}
%>
<center><h4><a href="javascript:history.back()">Continue</a></h4>

