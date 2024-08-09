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


.center button {
  width: 100%; /* Make button take the full width of the container */
  padding-left: 2.5rem;
  padding-right: 2.5rem;
  padding-top: 10px;
  padding-bottom: 10px;
  box-sizing: border-box; /* Ensures padding is included in width calculation */
  background-color:red;
  color:white;
  font-size:20px;
  border-radius:10px;
}
h1
{
	color:green;
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
	PreparedStatement pst=con.prepareStatement("select balance from user where ano=?");
	pst.setInt(1,Integer.parseInt(request.getParameter("a")));
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
		out.println("<div class='center'><h3>Balance Avaliable:</h3><h1>&#8377;"+rs.getInt(1)+"</h1><a href='NewForm.html' class='btn-link'><button type='button'>Go to Homepage</button></a>");
		
	}
	else
	{
		out.println("<div class='center'><h3>Invalid Account no,Try Again...</h3><a href='NewForm.html' class='btn-link'><button type='button'>Go to Homepage</button></a></div>");
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