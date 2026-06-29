<%@ page import="java.sql.*"%>

<html>
    <head>
<style>
body{
    margin:0;
    padding:30px;
    font-family:Arial, Helvetica, sans-serif;
    background:linear-gradient(135deg,#74ebd5,#ACB6E5);
}

.container{
    width:90%;
    margin:auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    color:#2c3e50;
    margin-bottom:30px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:white;
}

th{
    background:#3498db;
    color:white;
    padding:15px;
    font-size:17px;
}

td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tr:nth-child(even){
    background:#f8f9fa;
}

tr:hover{
    background:#eaf4ff;
}

a{
    text-decoration:none;
    background:#28a745;
    color:white;
    padding:8px 15px;
    border-radius:5px;
    font-weight:bold;
}

a:hover{
    background:#218838;
}
</style></head>
<body bgcolor="pink">

<center>
<h2>SEARCH RESULT</h2>

<table border="1" width="80%">

<tr>
<th>User Id</th>
<th>User Name</th>
<th>Phone</th>
<th>Email</th>
<th>Date Of Birth</th>
<th>Modify</th>
</tr>

<%

try
{
String userid=request.getParameter("userid");


Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst;
pst=con.prepareStatement("select * from user where userid=? and status='Active'");
pst.setString(1,userid);

ResultSet rs=pst.executeQuery();

while(rs.next())
{
%>

<tr>

<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td>

<a href="modifyfarmer2.jsp?id=<%=rs.getString(1)%>">Modify</a></td>
</tr>
<%
}

}
catch(Exception e)
{
out.println(e);
}
%>

</table>

</body>
</html>