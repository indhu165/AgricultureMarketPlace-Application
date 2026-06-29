<%@ page import="java.sql.*" %>

<%
try
{
String id=request.getParameter("id");

Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst=
con.prepareStatement(
"delete from cart where cartid=?");

pst.setString(1,id);

pst.executeUpdate();

response.sendRedirect("viewcart.jsp");

con.close();
}
catch(Exception e)
{
out.println(e);
}
%>