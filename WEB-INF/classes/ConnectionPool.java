package comm.connection;
import java.io.*;
import java.sql.*;

public class ConnectionPool 
{

	Connection conn=null;
	public Connection getConnection() throws Exception
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	conn =DriverManager.getConnection("jdbc:odbc:cyber","cyber","cyber");
    
	return conn;

	}
}