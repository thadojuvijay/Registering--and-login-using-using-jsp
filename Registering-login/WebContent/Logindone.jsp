<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("email");
String pwd=request.getParameter("password");

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection=  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "tiger");
Statement statement=connection.createStatement();

ResultSet resultSet=statement.executeQuery("select * from registration where email='" +id+ "' and password='" +pwd+ "'");
if(resultSet.next())
{
	session.setAttribute("userid", id);
out.println("login succesful");
}
else
{
response.sendRedirect("login1.jsp");
}





connection.close();

}
catch(ClassNotFoundException cs)
{
  out.println(cs);
}
catch(SQLException sq)
{
  out.println(sq);
}
catch(IOException io)
{
	
}
%>
</body>
</html>