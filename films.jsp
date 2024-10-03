<%if(session.getValue("login")==null) response.sendRedirect("cyber.jsp?invalidsession");%>
<html xmlns=""><head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<link class="catg" href="cyber.css" rel="stylesheet">
<title>Cyber Shopping Terminal</title>
</head><body><jsp:include page="admin_transactions.jsp" /><BR>
<BR><fieldset>
<legend>Add Films</legend><BR>
<table align=center cellspacing=1 cellpadding=3><form method=post action="addfilms.jsp">
<tr><Td align=right>Banner:</td><TD><input name="banner"></td></tr>
<tr><Td align=right>Film Name:</td><TD><input name="filmname"></td></tr>
<TR><TD align=right>Category:</td><td><select name=language>
<option value="tollywood">Tollywood [Telugu]
<option value="bollywood">Bollywood [Hindi]
<option value="hollywood">Hollywood [English]</select></td></tr>
<tr><Td colspan=2 align=center><button type=submit accesskey="P"><u>P</u>roceed</button>
&nbsp;&nbsp;<button type=submit accesskey="R"><u>R</u>eset</button>
</td></tr></table><BR></fieldset>
