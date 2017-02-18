<%@page import="java.sql.*"%>
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

String name=request.getParameter("username");
String id=request.getParameter("email");
      String pwd=request.getParameter("password");
      String cpwd=request.getParameter("cpassword");
      String number=request.getParameter("mobile number");
      
      try{

    	  Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection connection=  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "tiger");
    Statement statement=connection.createStatement();
    statement.executeUpdate("insert into registration values('"+name+"','"+id+"','"+pwd+"','"+cpwd+"','"+number+"')");

    response.sendRedirect("login.jsp");
    
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

%>

</body>
</html>