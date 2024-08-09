<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>AccountPage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style>
	.center {
  margin-top: 13%;
  margin-left: auto;
  margin-right: auto;
  width: 60%;
  padding: 20px; /* Increased padding for better spacing */
  display: flex;
  flex-direction: column;
  align-items: center;
}

.center h3 {
  margin-bottom: 20px; /* Add margin below the heading */
  text-align: center;
  font-size:35px;
}

.center input {
  margin-bottom: 20px; /* Add margin below the input */
  width: 100%; /* Make input take the full width of the container */
  padding: 10px;
  box-sizing: border-box; /* Ensures padding is included in width calculation */
}

.center button {
  width: 100%; /* Make button take the full width of the container */
  padding-left: 2.5rem;
  padding-right: 2.5rem;
  padding-top: 10px;
  padding-bottom: 10px;
  box-sizing: border-box; /* Ensures padding is included in width calculation */
}
html, body {
    height: 50%; /* Ensures the body takes up the full height of the viewport */
    margin: 0; /* Removes default margin */
    
}

body {
    background-image: url("Images/formjspimage5.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

</style>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
	<div class="center">
	<form action="findbal.jsp" method="post">
	<h3>Enter Account No:</h3><input type="text" name="a"/>
	<button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-success btn-lg"
      style="padding-left: 2.5rem; padding-right: 2.5rem;" value="find">Submit</button>
	</form>
	</div>
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