package bean;
import comm.connection.*;
import java.sql.*;
import java.util.*;



public class CategoryInsert {
	
	private String ctegory=null;
	private boolean b=false;
	private Vector  v=null;

	public String getCtegory() {
		return ctegory;
	}

	public void setCtegory(String ctegory) {

		System.out.println("---------sdddddd---"+ctegory);
		this.ctegory = ctegory;
	}

public Vector getV() {
		return v;
	}

	public void setV(Vector v) {
		this.v = v;
	}







public  boolean categoryDataInsert()throws Exception
	{

System.out.println(b+"--------ddddddddd-sdddddd---");
Connection conn=new comm.connection.ConnectionPool().getConnection();
String qry="insert into categorymaster values(?,?)";
PreparedStatement pstmt=conn.prepareStatement(qry);
pstmt.setInt(1,1);
pstmt.setString(2,ctegory);
b=pstmt.execute();
b=true;
return b;
}


public  boolean categoryDataUpdate(String seCategory,String category)throws Exception
	{
Connection conn=new comm.connection.ConnectionPool().getConnection();
String qry="update  categorymaster set CAT_NAME=? where CAT_NAME=?";
PreparedStatement pstmt=conn.prepareStatement(qry);
pstmt.setString(1,category);
pstmt.setString(2,seCategory);
b=pstmt.execute();
return b;
	}

Vector v1=null;
public Vector categoryDetails()throws Exception
{
	v1=new Vector();
Connection conn=new comm.connection.ConnectionPool().getConnection();
String qry="select CAT_NAME from categorymaster";
PreparedStatement pstmt=conn.prepareStatement(qry);
ResultSet rs= pstmt.executeQuery();
while(rs.next())
{
v1.add(rs.getString("CAT_NAME"));
System.out.println("--CategoryInsert-"+v1);
}
return v1;
}

}
