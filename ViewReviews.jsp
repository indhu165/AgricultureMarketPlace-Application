<%@ page import="java.sql.*" %>

<html>
    <head><style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:linear-gradient(to right, #f5f7fa, #c3cfe2);
}

/* Title */
h2{
    margin-top:25px;
    color:#0c162c;
    letter-spacing:1px;
}

/* Table */
table{
    width:90%;
    margin:25px auto;
    border-collapse:collapse;
    background:white;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

/* Header */
th{
    background:linear-gradient(to right, #667eea, #230d38);
    color:white;
    padding:14px;
    font-size:14px;
    border:none;
}

/* Cells */
td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #eee;
    color:#333;
    font-size:14px;
}

/* Row hover effect */
tr:hover td{
    background:#f8f9ff;
    transition:0.2s;
}

/* Make ratings stand out */
td:nth-child(4){
    font-weight:bold;
    color:#ff9800;
}

</style></head>
<body bgcolor="pink">

<center>

<h2>PRODUCT REVIEWS</h2>

<table border="1" width="90%">

<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>User</th>
<th>Rating</th>
<th>Review</th>
<th>Date</th>
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

PreparedStatement pst=
con.prepareStatement(
"select * from review");

ResultSet rs=
pst.executeQuery();

while(rs.next())
{
%>

<tr>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%>/5</td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
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