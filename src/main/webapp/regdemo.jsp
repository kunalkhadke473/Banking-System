<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body bgcolor="green">
<% 
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/morning9","root","Kunal@123");
	PreparedStatement pst=con.prepareStatement("insert into user values(?,?,?,?,?)");
	pst.setString(1,request.getParameter("f1"));
	pst.setString(2,request.getParameter("f2"));
	pst.setInt(3,Integer.parseInt(request.getParameter("f3")));
	pst.setString(4,request.getParameter("f4"));
	pst.setInt(5,Integer.parseInt(request.getParameter("f5")));
	int i=pst.executeUpdate();
	out.println("<h1>Registration Success...");
	con.close();
	out.close();	
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>