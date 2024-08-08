<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body bgcolor="Cyan">
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/morning9","root","Kunal@123");
	PreparedStatement pst=con.prepareStatement("select * from user where uname=? and password=?");
	pst.setString(1,request.getParameter("f1"));
	pst.setString(2,request.getParameter("f2"));
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
%>
	<form action="findbal.jsp" method="post">
	Enter Account No:<input type="text" name="a"/>
	<Input type="submit" value="find"/>	
	</form>
<% 
	}
	else
		out.println("<h1>Login Failed,Try Again...");
}
catch(Exception e)
{	
	out.println(e);
}

%>
</body>
</html>