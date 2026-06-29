<html>
<head>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #fff1eb, #ace0f9);
}

/* Title */
h2{
    text-align:center;
    margin-top:30px;
    color:#333;
    letter-spacing:1px;
}

/* Table styling */
table{
    width:90%;
    margin:30px auto;
    background:white;
    border-collapse:collapse;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

/* Header */
th{
    background:linear-gradient(to right, #ff416c, #ff4b2b);
    color:white;
    padding:12px;
    border:none;
    font-size:14px;
}

/* Cells */
td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #eee;
    font-size:14px;
    color:#333;
}

/* Highlight low stock rows */
tr:hover td{
    background:#fff5f5;
    transition:0.2s;
}

/* Summary text */
h3{
    text-align:center;
    color:#222;
    margin-top:15px;
}

center{
    margin-top:20px;
}

</style>

</head>

<body bgcolor="pink">

<h2>LOW STOCK ALERT</h2>

<%@ page import="java.sql.*"%>

<%
int count=0;

try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");
String fid =
session.getAttribute("id").toString();

PreparedStatement pst=
con.prepareStatement(
"select * from product where status='Available' and userid=?");

pst.setString(1,fid);

ResultSet rs=pst.executeQuery();
%>

<table>

<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>Category</th>
<th>Quantity</th>
<th>Price</th>
</tr>

<%
while(rs.next())
{
int qty=Integer.parseInt(rs.getString("quantity"));

if(qty<10)
{
count++;
%>

<tr>

<td><%=rs.getString("productid")%></td>
<td><%=rs.getString("productname")%></td>
<td><%=rs.getString("category")%></td>
<td><%=qty%></td>
<td><%=rs.getString("price")%></td>

</tr>

<%
}
}
%>

</table>

<br>

<center>

<h3>Low Stock Products : <%=count%></h3>

</center>

<%
rs.close();
pst.close();
con.close();
}
catch(Exception e)
{
out.println(e);
}
%>

</body>
</html>