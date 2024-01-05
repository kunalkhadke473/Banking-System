<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html>
<html>
<body>
<h1>
<%
String un=request.getParameter("t1");
String ps=request.getParameter("t2");
	if(un.equals("admin")&&ps.equals("admin"))
		out.println("Login Success");
	else
		out.println("Login Failed...");
%>
</h1>
</body>
</html>