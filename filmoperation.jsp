<link href="cyber.css" rel="stylesheet">
<jsp:include page="user_transactions.jsp" />
<%@ page import="java.sql.*"%>
<%
    if(session.getValue("login")==null) response.sendRedirect("cyber.jsp?invalidsession");
	Connection con=null;
	PreparedStatement sst=null;
	Statement st=null;
	ResultSet rs=null;
 %>
<% 
   String head="";
   String cmd;
   int count=0;
   String query="";
   String banner,fname,language;
   String buffer="";
   String buffer2="";
   String vbuffer="";
   int majority=0;
    try {
  	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:cyber","cyber","cyber");
    st=con.createStatement();
    String film=request.getParameter("based");
	if(film.equals("top")) {
	cmd="select banner,name,language,max(votes) from topfilms group by banner,name,language";
	head+="<table align=center width=700 cellspacing=1 cellpadding=2 bgcolor=lightslategray>";
	head+="<tr bgcolor=lightslategray><th style='color:aliceblue'>S.no</th><th style='color:aliceblue'>Banner</th><th style='color:aliceblue'>Film Name</th><th style='color:aliceblue'>Language</th><th style='color:aliceblue'>Votes Majority</th></tr>";
	rs=st.executeQuery(cmd);
	while(rs.next()) {
		count++;
        banner=rs.getString(1);
		fname=rs.getString(2);
        language=rs.getString(3);
		majority=rs.getInt(4);
		vbuffer+="<TR bgcolor=whitesmoke>";
		vbuffer+="<TD class=padd>"+count+"</td>";
		vbuffer+="<TD class=padd>"+banner+"</td>";
		vbuffer+="<TD class=padd>"+fname+"</td>";
		vbuffer+="<TD class=padd>"+language+"</td>";
		vbuffer+="<TD class=padd>"+majority+"</td>";
		vbuffer+="</TR>";
	}  if(vbuffer.length()>0)  { out.println(head+vbuffer); return;}
	   else { out.println("<center><p>Sorry! No Films Found</center>");return;}
	}
    else if(film.equals("search")) {
	query=request.getParameter("search");
	cmd="select * from films where name='"+query+"'";
    rs=st.executeQuery(cmd);
	head+="<table align=center width=700 cellspacing=1 cellpadding=2 bgcolor=lightslategray>";
	head+="<tr bgcolor=lightslategray><th style='color:aliceblue'>S.no</th><th style='color:aliceblue'>Banner</th><th style='color:aliceblue'>Film Name</th><th style='color:aliceblue'>Language</th></tr>";
	while(rs.next()) {
		count++;
        banner=rs.getString(1);
		fname=rs.getString(2);
        language=rs.getString(3);
		buffer+="<TR bgcolor=whitesmoke>";
		buffer+="<TD class=padd>"+count+"</td>";
		buffer+="<TD class=padd>"+banner+"</td>";
		buffer+="<TD class=padd>"+fname+"</td>";
		buffer+="<TD class=padd>"+language+"</td>";
		buffer+="</TR>";
	}  if(buffer.length()>0)  { out.println(head+buffer); return;}
	   else { out.println("<center><p>Sorry! No Films Found</center>");return;}
    }
 	else {
	cmd="select * from films";
	String fm="";
    rs=st.executeQuery(cmd);
	head+="<table align=center width=700 cellspacing=1 cellpadding=2 bgcolor=lightslategray><form action='voting.jsp'>";
	head+="<tr bgcolor=lightslategray><th style='color:aliceblue'>S.no</th><th style='color:aliceblue'>Banner</th><th style='color:aliceblue'>Film Name</th><th style='color:aliceblue'>Language</th></tr>";
	String butt="<BR><BR><center><button type=submit>Vote This Films</button>&nbsp;&nbsp;<button type=reset>Refresh</button></center></form>";
	while(rs.next()) {
		count++;
        banner=rs.getString(1);
		fname=rs.getString(2);
        language=rs.getString(3);
		buffer2+="<TR bgcolor=whitesmoke>";
		buffer2+="<TD class=padd>"+count+"</td>";
		buffer2+="<TD class=padd><input style='display:none' checked value='"+banner+"' type=checkbox class=check name=banner>"+banner+"</td>";
		buffer2+="<TD class=padd><input value='"+fname+"' type=checkbox class=check name='film"+count+"'>"+fname+"</td>";
		buffer2+="<TD class=padd><input style='display:none' checked value='"+language+"' type=checkbox class=check name=language>"+language+"</td>";
		buffer2+="</TR>";
	}  if(buffer2.length()>0)  { out.println(head+buffer2+"</table>"+butt); return;}
	   else { out.println("<center><p>Sorry! No Films Found</center>");return;}
          }
	} catch(Exception e) {
		String msg=e.getMessage().toString();
		String toprint=msg.substring(msg.lastIndexOf(":"));
		out.println("<center><div class=report><font color=green>Error Occured Due to The"+toprint+"</font></div></center>"); }
%>
