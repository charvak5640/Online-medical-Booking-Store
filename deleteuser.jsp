<%@ page import="java.sql.*"%>
<%
    if(session.getValue("login")==null) response.sendRedirect("cyber.jsp?invalidsession");
	Connection con=null;
	PreparedStatement sst=null;
	Statement st=null;
	ResultSet rs=null;
 %>
<html xmlns=""><head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<link class="catg" href="cyber.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
</head><body><jsp:include page="admin_transactions.jsp" />
<BR>
<fieldset>
<legend>Delete Existing User</legend><BR>
<%
    String head="";
	String buff="";
	try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:cyber","cyber","cyber");
    st=con.createStatement();
	String cmd="Select * from cyber_signup";
    rs=st.executeQuery(cmd);
    head+="<table align=center cellspacing=1 cellpadding=3 bgcolor=lightslategray><form method=post action='admin_deleteuserchecked.jsp'>";
	head+="<tr bgcolor=lightslategray><th width='10%' style='color:aliceblue'>S.no</th><th  width='10%' style='color:aliceblue'>User Name</th><th width='10%'  style='color:aliceblue'>E-mail</th><th  width='10%' style='color:aliceblue'>Gender</th><th width='10%'  style='color:aliceblue'>Address</th><th  width='10%' style='color:aliceblue'>Occupation</th></tr>";
	int count=0;
	while(rs.next()) {
		count++;
		String name=rs.getString("user_name");
		String email=rs.getString("alternate_email");
		String sex=rs.getString("sex");
		String addr=rs.getString("address");
		String occp=rs.getString("occupation");
		buff+="<TR bgcolor=whitesmoke><TD>"+count+"</td><td><input name=user value='"+name+"' type=checkbox class=check>"+name+"</td><Td>"+email+"<TD>"+sex+"</td><TD>"+addr+"</td><td>"+occp+"</td></tr>";
	}
    if(buff.length()>0) out.println(head+buff+"</table>");
	else out.println("<link href='cyber.css' rel='stylesheet'><center><p>No Users Found.Users Terminal is Empty</p></center>");
   }   catch(Exception e) {
       out.println("<link href='cyber.css' rel='stylesheet'><center><p>No Users Found</p>");
       }
%>
<BR><BR><table align=center width=600>
<tr><Td align=center><button type=submit accesskey="P"><u>P</u>roceed</button>
&nbsp;&nbsp;<button type=submit accesskey="R"><u>R</u>eset</button>
</td></tr></form></table><BR></fieldset>
</body></html>
