<%@ page import="java.sql.*"%>

<html>
<head>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #dfe9f3, #ffffff);
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
    border-collapse:collapse;
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

/* Header */
th{
    background:linear-gradient(to right, #4facfe, #00f2fe);
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

/* Row hover effect */
tr:hover td{
    background:#f2f9ff;
    transition:0.2s;
}

/* Summary section */
h3{
    text-align:center;
    color:#222;
    margin:10px;
}

center{
    margin-top:20px;
}

</style>
</head>

<body bgcolor="pink">

<h2>STOCK REPORT</h2>

<%
int count=0;
int grandTotal=0;

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
    "select * from product where status='Available' and userid=?");

    pst.setString(1,fid);

    ResultSet rs=
    pst.executeQuery();
%>

<table>

<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>Category</th>
<th>Quantity</th>
<th>Price</th>
<th>Total Value</th>
</tr>

<%
while(rs.next())
{
    count++;

    int qty=
    Integer.parseInt(rs.getString("quantity"));

    int price=
    Integer.parseInt(rs.getString("price"));

    int total=qty*price;

    grandTotal=grandTotal+total;
%>

<tr>

<td><%=rs.getString("productid")%></td>
<td><%=rs.getString("productname")%></td>
<td><%=rs.getString("category")%></td>
<td><%=qty%></td>
<td><%=price%></td>
<td><%=total%></td>

</tr>

<%
}
%>

</table>

<br><br>

<center>

<h3>Total Products : <%=count%></h3>

<h3>Total Inventory Value : Rs. <%=grandTotal%></h3>

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