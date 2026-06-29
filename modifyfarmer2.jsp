<%@ page import="java.sql.*"%>

<%
String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst=
con.prepareStatement(
"select * from user where userid=?");

pst.setString(1,id);

ResultSet rs=pst.executeQuery();

if(rs.next())
{
%>

<html>
    <head>
<style>
body{
    margin:0;
    padding:0;
    font-family:Arial, Helvetica, sans-serif;
    background:linear-gradient(135deg,#74ebd5,#ACB6E5);
}

.container{
    width:500px;
    margin:60px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    color:#2c3e50;
    margin-bottom:25px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#3498db;
    color:white;
    padding:12px;
    width:40%;
}

td{
    padding:12px;
    background:#f8f9fa;
}

input[type=text]{
    width:95%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:15px;
}

input[type=submit]{
    background:#28a745;
    color:white;
    border:none;
    padding:12px 25px;
    font-size:16px;
    border-radius:5px;
    cursor:pointer;
    margin-top:20px;
}

input[type=submit]:hover{
    background:#218838;
}
</style>
</head>
<body bgcolor="pink">

<center>

<h2>MODIFY FARMER DETAILS</h2>

<form action="modifyfarmer2.jsp">

<table border="1">

<tr>
<th>User Id</th>
<td>
<input type="text" name="t1"
value="<%=rs.getString(1)%>" readonly>
</td>
</tr>

<tr>
<th>User Name</th>
<td>
<input type="text" name="t2"
value="<%=rs.getString(2)%>">
</td>
</tr>

<tr>
<th>Phone</th>
<td>
<input type="text" name="t3"
value="<%=rs.getString(3)%>">
</td>
</tr>

<tr>
<th>Email</th>
<td>
<input type="text" name="t4"
value="<%=rs.getString(4)%>">
</td>
</tr>
<tr>
<th>Date Of Birth</th>
<td>
<input type="text" name="t5"
value="<%=rs.getString(5)%>">
</td>
</tr>

</table>

<br>

<input type="submit" name="update" value="UPDATE">

</form>

</center>

</body>
</html>

<%
}
if(request.getParameter("update")!=null)
{
String uid=request.getParameter("t1");
String uname=request.getParameter("t2");
String ph=request.getParameter("t3");
String em=request.getParameter("t4");
String dob=request.getParameter("t4");

PreparedStatement pst1=
con.prepareStatement(
"update user set username=?,phno=?,email=? where userid=?");

pst1.setString(1,uname);
pst1.setString(2,ph);
pst1.setString(3,em);
pst1.setString(4,uid);
pst1.setString(4,dob);

int x=pst1.executeUpdate();

if(x>0)
{
    out.println("<h3>Updated Successfully</h3>");
    out.println("<br><a href='modifyfarmer.jsp'>Click Here</a> to Back");
}
else
{
    out.println("<h3>Update Failed</h3>");
    out.println("<br><a href='modifyfarmer.jsp'>Click Here</a> to Back");
}
}
%>
