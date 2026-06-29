<html>
<head>
<title>Farmer Details</title>

<style>

body{
    margin:0;
    padding:20px;
    font-family:Arial;
    background:#f4f6f9;
}

h2{
    text-align:center;
    color:#0c0c29;
    font-size:35px;
    margin-bottom:30px;
}

table{
    width:100%;
    background:white;
    border-collapse:collapse;
    box-shadow:0px 5px 20px rgba(0,0,0,0.2);
    border-radius:15px;
    overflow:hidden;
}

th{
    background:#2e3945;
    color:white;
    padding:15px;
    border:1px solid #ddd;
}

td{
    padding:15px;
    text-align:center;
    border:1px solid #ddd;
}

tr:nth-child(even){
    background:#f8f8f8;
}

tr:hover{
    background:#e8f5e9;
}

img{
    border-radius:50%;
    border:3px solid #4CAF50;
}

a{
    text-decoration:none;
    color:#d32f2f;
    font-weight:bold;
}

a:hover{
    color:red;
}

.deletebtn{
    background:#f44336;
    color:white;
    padding:8px 15px;
    border-radius:8px;
}

.deletebtn:hover{
    background:#c62828;
}

</style>

</head>

<body>

<center>
<h2> FARMER DETAILS</h2>
</center>

<table>

<tr>
<th>Farmer Id</th>
<th>Farmer Name</th>
<th>Phone Number</th>
<th>Email</th>
<th>DOB</th>
<th>Gender</th>
<th>Image</th>
<th>Joining Date</th>
<th>Password</th>
<th>Delete</th>
</tr>

<%@ page import="java.sql.*"%>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con =
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst =
con.prepareStatement(
"select * from user where status='Active'");

ResultSet rs =
pst.executeQuery();

while(rs.next())
{
%>

<tr>

<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>

<td>
<%
String x = rs.getString(7);

if(x!=null && !x.equals(""))
{
%>
<a href="zoom.jsp?t1=<%=x%>">
<img src="<%=x%>" width="80" height="80">
</a>
<%
}
else
{
out.println("No Image");
}
%>
</td>

<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>

<td>
<a class="deletebtn"
href="deletefarmer.jsp?id=<%=rs.getString(1)%>"
onclick="return confirm('Are you sure you want to delete this farmer?')">
Delete
</a>
</td>

</tr>

<%
}

rs.close();
pst.close();
con.close();
}
catch(Exception e)
{
out.println(e);
}
%>

</table>

</body>
</html>