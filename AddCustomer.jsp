<html>
<head>
    <style>
body{
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(135deg,#74ebd5,#ACB6E5);
    margin:0;
    padding:30px;
}

h2{
    color:#2c3e50;
    margin-bottom:25px;
    font-size:30px;
}

table{
    background:white;
    border-collapse:collapse;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
}

th{
    background:#3498db;
    color:white;
    padding:15px;
    text-align:left;
    width:40%;
}

td{
    padding:15px;
    background:#f8f9fa;
}

input[type=text],
input[type=number],
input[type=email],
input[type=date],
input[type=password]{
    width:95%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:15px;
    outline:none;
}

input[type=text]:focus,
input[type=number]:focus,
input[type=email]:focus,
input[type=date]:focus,
input[type=password]:focus{
    border-color:#3498db;
    box-shadow:0px 0px 5px rgba(52,152,219,0.5);
}

input[type=radio]{
    margin-left:10px;
}

input[type=submit]{
    background:#28a745;
    color:white;
    border:none;
    padding:12px 30px;
    font-size:16px;
    border-radius:6px;
    cursor:pointer;
    margin-top:20px;
}

input[type=submit]:hover{
    background:#218838;
    transform:scale(1.05);
    transition:0.3s;
}
</style>
</head>

<body bgcolor="pink" text="black">

<center>
<h2>CUSTOMER REGISTRATION</h2>

<form action="AddCustomerServlet" method="post">

<%@ page import="java.sql.*"%>

<%
int no=0;

try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst=
con.prepareStatement("select max(userid) from customer");

ResultSet rs=pst.executeQuery();

if(rs.next() && rs.getString(1)!=null)
{
no=Integer.parseInt(rs.getString(1))+1;
}
else
{
no=2001;
}
}
catch(Exception e)
{
no=2001;
}
%>

<table border="1" width="40%">

<tr>
<th>Customer Id</th>
<td>
<input type="text" name="t1" value="<%=no%>" readonly>
</td>
</tr>

<tr>
<th>Customer Name</th>
<td>
<input type="text" name="t2">
</td>
</tr>

<tr>
<th>Phone Number</th>
<td>
<input type="number" name="t3">
</td>
</tr>

<tr>
<th>Email</th>
<td>
<input type="email" name="t4">
</td>
</tr>

<tr>
<th>Date Of Birth</th>
<td>
<input type="date" name="t5">
</td>
</tr>

<tr>
<th>Gender</th>
<td>
<input type="radio" name="t6" value="Male">Male

<input type="radio" name="t6" value="Female">Female

<input type="radio" name="t6" value="Others">Others
</td>
</tr>

<tr>
<th>Address</th>
<td>
<input type="text" name="t7">
</td>
</tr>

<tr>
<th>Password</th>
<td>
<input type="password" name="t8">
</td>
</tr>

</table>

<br>

<input type="submit" value="REGISTER">

</form>

</center>

</body>
</html>