<%@ page import="java.sql.*"%>

<html>
<body bgcolor="pink">

<center>
<%
String id=request.getParameter("id");

Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst=
con.prepareStatement(
"delete from product where productid=?");

pst.setInt(1, Integer.parseInt(id));

int x=pst.executeUpdate();

if(x>0)
    out.println("Deleted Successfully");
else
    out.println("Delete Failed");

con.close();
%>
<br><br>

<a href="viewproduct.jsp">
Click Here
</a>
to Back

</center>

</body>
</html>