<%@ page import="java.sql.*"%>
<%if(session.getValue("login")==null) response.sendRedirect("cyber.jsp?invalidsession");%>
<html><head>
<link class="catg" href="cyber.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
<script language="javascript">
function Validation(viewbag)
{
	if(viewbag.ccno.value=="")
	{
	alert("please enter value in creditcard no field");
	viewbag.ccno.focus();
	return (false);
	}
	if(viewbag.ccno.value.length<17)
	{
	alert("please enter minimum 16 digits in creditcard no field");
	viewbag.ccno.focus();
	return (false);
	}
	if(viewbag.cctype.value=="")
	{
	alert("please enter a value in creditcard type field");
	viewbag.cctype.focus();
	return (false);
	}
	if(viewbag.dd.value=="")
	{
	alert("please enter date value in expdate field");
	viewbag.dd.focus();
	return (false);
	}
	if(viewbag.mm.value=="")
	{
	alert("please enter a value to month in expdate field");
	viewbag.mm.focus();
	return (false);
	}
	if(viewbag.yyyy.value=="")
	{
	alert("please enter a value to creditcard no in expdate field");
	viewbag.yyyy.focus();
	return (false);
	}
	if(viewbag.cvv.value=="")
	{
	alert("please enter a value to cvv in cvv no field");
	viewbag.cvv.focus();
	return (false);
	}
}
</script>
</head>
<body>
<jsp:include page="user_transactions.jsp" />
<%
    String buff="";
	String head="";
    Connection con=null;
	PreparedStatement stmt=null;
	Statement st=null;
	ResultSet rs=null;
    java.text.SimpleDateFormat fmt=new java.text.SimpleDateFormat("dd-MMM-yyyy");
    String odate=fmt.format(new java.util.Date()).toString();
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:cyber","cyber","cyber");
		if(session.getValue("login")==null) response.sendRedirect("cyber.jsp?invalid");	
    st=con.createStatement();
	String cmd="Select * from cart";
    rs=st.executeQuery(cmd);
    head+="<table align=center cellspacing=1 cellpadding=3 bgcolor=lightslategray><form method=post action='sendorder.jsp' name='viewbag' onSubmit='return Validation(viewbag)'>";
	head+="<tr bgcolor=lightslategray><th width='10%' style='color:aliceblue'>S.No</th><th  width='10%' style='color:aliceblue'>Category</th><th  width='10%' style='color:aliceblue'>Item Name</th><th  width='10%' style='color:aliceblue'>Description</th><th   width='10%' style='color:aliceblue'>Price</th><th  width='10%' style='color:aliceblue'>Qunatity</th><th  width='10%' style='color:aliceblue'>Total</th></tr>";
	int count=0;
	float grand=0;
	while(rs.next()) {
		count++;
		String category=rs.getString("category");
		String item=rs.getString("itemname");
		String desc=rs.getString("description");
		float price =rs.getFloat("price");
		int qty=rs.getInt("Quantity");
		float total=price*qty;
		buff+="<TR bgcolor=whitesmoke><TD>"+count+"</td><td><input type=checkbox checked class=check style='display:none' name= category value='"+category+"'>"+category+"</td><Td><input type=checkbox checked class=check style='display:none' name=itemname value='"+item+"'>"+item+"</td><TD><input type=checkbox checked class=check style='display:none' name= description value='"+desc+"'>"+desc+"</td><td><input type=checkbox checked class=check style='display:none' name=price value='"+price+"'>"+price+"</td><td><input type=checkbox checked class=check style='display:none' name=quantity value='"+qty+"'>"+qty+"</td><td><input type=checkbox checked class=check style='display:none' name=total value='"+total+"'>"+total+"</td></tr>\n";
		grand+=total;
	}
    if(buff.length()>0) {
		out.println(head+buff);
		out.println("<TR><th colspan=6 align=right style='color:aliceblue'>Grand Total</th><Th align=center  style='color:aliceblue'><input name=grandtotal type=hidden value='"+grand+"'>"+grand+"</th></tr></table>");		
		}
	else out.println("<link href='cyber.css' rel='stylesheet'><center><p>No Items Found.Cart is Empty</p></center>");
   }   catch(Exception e) {
       out.println("<link href='cyber.css' rel='stylesheet'><center><p>No Items Found</p>");
       }
%>

<table width="100%" border="0" align="center">
  <tr>
    <td width="44%" align="right">Creditcard No</td>
    <td width="6%" rowspan="6">&nbsp;</td>
    <td colspan="3"><input type="text" name="ccno" /></td>
  </tr>
<tr>
    <td width="44%" align="right">Address</td>
    <td width="6%" rowspan="6">&nbsp;</td>
    <td colspan="3"><textarea  name="address"  rows="4" cols="16">
	</textarea>
	</td>
  </tr>

  <tr>
    <td align="right">Credit card Type </td>
    <td colspan="3"><select name="cctype">
      <option>select type</option>
      <option value="Master card">Master card</option>
      <option value="Visa card">Visa card</option>
    </select></td>
  </tr>
  <tr>
    <td align="right">Exp Date </td>
    <td width="15%"><select name="dd">
      <option>dd</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      <option value="06">06</option>
      <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
      <option value="24">24</option>
      <option value="25">25</option>
      <option value="26">26</option>
      <option value="27">27</option>
      <option value="28">28</option>
      <option value="29">29</option>
      <option value="30">30</option>
      <option value="31">31</option>
    </select></td>
    <td width="11%"><select name="mm">
      <option>mm</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      <option value="06">06</option>
      <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
    </select></td>
    <td width="24%"><select name="yyyy">
      <option>year</option>
      <option value="2008">2012</option>
      <option value="2009">2013</option>
      <option value="2010">2014</option>
      <option value="2011">2015</option>
      <option value="2012">2016</option>
      <option value="2013">2017</option>
      <option value="2014">2018</option>
      <option value="2015">2019</option>
	  <option value="2015">2020</option>
    </select></td>
  </tr>
  <tr>
    <td align="right">cvv no </td>
    <td height="23" colspan="3"><input type="password" name="cvv" /></td>
  </tr>
  <tr>
    <td rowspan="2" align="right">&nbsp;</td>
    <td height="9" colspan="3"></td>
  </tr>
  <tr>
    <td colspan="3"></td>
  </tr>
</table>
<%out.println("<center><input name=odate type=hidden value='"+odate+"'><button type=submit accesskey='S'><U>S</u>end Order Now</button></center>");%>
</form>
</body></html>
