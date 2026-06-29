<%@ page import="java.sql.*" %>

<html>
    <head><style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #d4d48c, #12a3a1);
}

/* Title section */
h2{
    color:#333;
    margin-top:20px;
    letter-spacing:1px;
}

h3{
    color:#222;
    margin-top:30px;
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
    background:linear-gradient(to right, #377286, #144653);
    color:white;
    padding:12px;
    font-size:14px;
    border:none;
}

/* Cells */
td{
    padding:12px;
    text-align:center;
    font-size:14px;
    color:#333;
    border-bottom:1px solid #eee;
}

/* Hover effect */
tr:hover td{
    background:#fff6f8;
    transition:0.2s;
}

/* Links inside table */
a{
    display:inline-block;
    margin-top:5px;
    padding:6px 10px;
    text-decoration:none;
    background:#133351;
    color:white;
    border-radius:6px;
    font-size:12px;
    transition:0.3s;
}

a:hover{
    background:#15424e;
    transform:scale(1.05);
}

/* Accept status text */
td a + a{
    background:#43e97b;
}

</style></head>
<body bgcolor="pink">

<center>
<h3>Logged in Farmer ID :
<%=session.getAttribute("id")%>
</h3>
<h2>CUSTOMER ORDERS</h2>

<table border="1" width="95%">

<tr>
<th>Order ID</th>
<th>Customer ID</th>
<th>Product ID</th>
<th>Product Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Amount</th>
<th>Order Date</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
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
"select * from orders where farmerid=?");

pst.setString(1,fid);

ResultSet rs=
pst.executeQuery();

while(rs.next())
{
%>

<tr>

<td><%=rs.getString(1)%></td>
<td>
<%=rs.getString(2)%>
<br>
<a href="ViewCustomerDetailsServlet?id=<%=rs.getString(2)%>">
View Details
</a>
</td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>

<td>

<%
if(rs.getString(9).equals("Pending"))
{
%>

<a href="AcceptOrderServlet?id=<%=rs.getString(1)%>">
Accept
</a>

<%
}
else
{
out.println("Accepted");
}
%>

</td>

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