<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<% 
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/morning9","root","Kunal@123");
	PreparedStatement pst=con.prepareStatement("select balance from user where ano=?");
	pst.setInt(1,Integer.parseInt(request.getParameter("a")));
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
		out.println("<h1>Your balance="+rs.getInt(1));
	}
	else
	{
		out.println("<h1>Invalid Account no,Try Again...</h1>");
		rs.close();
		con.close();
		out.close();
	}
}
catch(Exception e)
{
	out.println(e);	
}
%>


</body>
</html>