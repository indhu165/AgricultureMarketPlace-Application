<html>
<head>
<title>Farmer Registration</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:linear-gradient(to right,#ef366d,#81C784);
}

.container{
    width:700px;
    margin:30px auto;
    background:white;
    border-radius:20px;
    padding:30px;
    box-shadow:0px 0px 20px gray;
}

h2{
    color:#071707;
    text-align:center;
    margin-bottom:25px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#2ba292;
    color:white;
    padding:15px;
    width:35%;
    text-align:left;
}

td{
    padding:15px;
    background:#f9f9f9;
}

input[type=text],
input[type=password],
input[type=email],
input[type=date],
input[type=number],
input[type=file]
{
    width:95%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:8px;
}

input[type=submit]
{
    background:#4CAF50;
    color:white;
    border:none;
    padding:12px 30px;
    font-size:18px;
    border-radius:8px;
    cursor:pointer;
    margin-top:20px;
}

input[type=submit]:hover
{
    background:#2E7D32;
}

</style>

</head>

<body>

<div class="container">

<center>

<h2>FARMER REGISTRATION</h2>

<form action="addfarmer1.jsp">

<%@ page import="java.sql.*"%>

<%
int no=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst=
con.prepareStatement(
"select max(userid) from user");

ResultSet rs=
pst.executeQuery();

if(rs.next())
{
no=Integer.parseInt(rs.getString(1))+1;
}
}
catch(Exception e)
{
no=1001;
}
%>

<table border="1">

<tr>
<th>User Id</th>
<td>
<input type="text"
name="t1"
value="<%=no%>"
readonly>
</td>
</tr>

<tr>
<th>User Name</th>
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
<input type="radio" name="t6" value="Female"> Female
<input type="radio" name="t6" value="Male"> Male
<input type="radio" name="t6" value="Others"> Others
</td>
</tr>

<tr>
<th>Upload Image</th>
<td>
<input type="file" name="t7">
</td>
</tr>

<tr>
<th>Joining Date</th>

<%
java.text.SimpleDateFormat sd=
new java.text.SimpleDateFormat("dd-MM-yyyy");

String str=
sd.format(
new java.util.Date()).toString();
%>

<td>
<input type="text"
name="t8"
value="<%=str%>"
readonly>
</td>

</tr>

<tr>
<th>Password</th>
<td>
<input type="password" name="t9">
</td>
</tr>

</table>

<br>

<input type="submit"
value="REGISTER">

</form>

</center>

</div>

</body>
</html>
```
