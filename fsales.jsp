<%@page import="java.sql.*"%>

<html>
<head>
<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #e0eafc, #cfdef3);
}

/* Title */
h2{
    text-align:center;
    margin-top:20px;
    color:#333;
    letter-spacing:1px;
}

/* Stats boxes (you already used class="box") */
.box{
    display:inline-block;
    width:200px;
    margin:20px;
    padding:20px;
    background:white;
    border-radius:12px;
    box-shadow:0 10px 20px rgba(0,0,0,0.15);
    font-size:16px;
    font-weight:bold;
    color:#333;
    transition:0.3s;
}

.box:hover{
    transform:scale(1.05);
    box-shadow:0 15px 25px rgba(0,0,0,0.2);
}

/* Table styling */
table{
    width:95%;
    margin:20px auto;
    border-collapse:collapse;
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

/* Header */
th{
    background:linear-gradient(to right, #2193b0, #6dd5ed);
    color:white;
    padding:12px;
    border:none;
    font-size:14px;
}

/* Cells */
td{
    padding:12px;
    text-align:center;
    font-size:14px;
    color:#333;
    border-bottom:1px solid #eee;
}

/* Row hover */
tr:hover td{
    background:#f5fbff;
    transition:0.2s;
}

</style>
</head>

<body bgcolor="pink">

<center>

<h2>TRACK SALES AND EARNINGS</h2>

<%
int totalOrders=0;
int acceptedOrders=0;
int totalEarnings=0;

try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

String fid=
session.getAttribute("id").toString();

PreparedStatement pst=
con.prepareStatement(
"select count(*) from orders where farmerid=?");

pst.setString(1,fid);

ResultSet rs=
pst.executeQuery();

if(rs.next())
{
totalOrders=rs.getInt(1);
}

PreparedStatement pst2=
con.prepareStatement(
"select count(*) from orders where farmerid=? and status='Accepted'");

pst2.setString(1,fid);

ResultSet rs2=
pst2.executeQuery();

if(rs2.next())
{
acceptedOrders=rs2.getInt(1);
}

PreparedStatement pst3=
con.prepareStatement(
"select sum(amount) from orders where farmerid=? and status='Accepted'");

pst3.setString(1,fid);

ResultSet rs3=
pst3.executeQuery();

if(rs3.next())
{
totalEarnings=rs3.getInt(1);
}
%>

<div class="box">
Total Orders
<br><br>
<%=totalOrders%>
</div>

<div class="box">
Accepted Orders
<br><br>
<%=acceptedOrders%>
</div>

<div class="box">
Total Earnings
<br><br>
Rs <%=totalEarnings%>
</div>

<br><br>

<h2>Sales History</h2>

<table>

<tr>
<th>Order ID</th>
<th>Customer ID</th>
<th>Product Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Amount</th>
<th>Date</th>
<th>Status</th>
</tr>

<%
PreparedStatement pst4=
con.prepareStatement(
"select * from orders where farmerid=?");

pst4.setString(1,fid);

ResultSet rs4=
pst4.executeQuery();

while(rs4.next())
{
%>

<tr>
<td><%=rs4.getString("orderid")%></td>
<td><%=rs4.getString("userid")%></td>
<td><%=rs4.getString("productname")%></td>
<td><%=rs4.getString("price")%></td>
<td><%=rs4.getString("quantity")%></td>
<td><%=rs4.getString("amount")%></td>
<td><%=rs4.getString("orderdate")%></td>
<td><%=rs4.getString("status")%></td>
</tr>

<%
}

con.close();
}
catch(Exception e)
{
out.println(e);
}
%>

</table>

</center>

</body>
</html>