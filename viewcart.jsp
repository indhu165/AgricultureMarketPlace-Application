<%@ page import="java.sql.*" %>

<html>
<head>
<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #fdfbfb, #ebedee);
}

/* Title */
h2{
    margin-top:20px;
    color:#333;
    letter-spacing:1px;
}

/* Table */
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
    background:linear-gradient(to right, #36d1dc, #5b86e5);
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
    background:#f5fbff;
    transition:0.2s;
}

/* Remove link */
a{
    display:inline-block;
    padding:6px 12px;
    background:#ff4d4d;
    color:white;
    text-decoration:none;
    border-radius:6px;
    font-size:13px;
    transition:0.3s;
}

a:hover{
    background:#e60000;
    transform:scale(1.05);
}

/* Total amount */
h3{
    color:#222;
    margin-top:15px;
}

/* Place order button */
input[type="submit"]{
    background:linear-gradient(to right, #43e97b, #38f9d7);
    border:none;
    padding:12px 25px;
    color:white;
    font-size:16px;
    border-radius:10px;
    cursor:pointer;
    transition:0.3s;
}

input[type="submit"]:hover{
    transform:scale(1.05);
    box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

</style>
</head>

<body bgcolor="pink">

<center>

<h2>MY CART</h2>

<table border="1">

<tr>
<th>Cart ID</th>
<th>Product ID</th>
<th>Product Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Amount</th>
<th>Action</th>
</tr>

<%

int total=0;

try
{
String uid=
session.getAttribute("id").toString();

Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst=
con.prepareStatement(
"select * from cart where userid=?");

pst.setString(1,uid);

ResultSet rs=
pst.executeQuery();

while(rs.next())
{
total=total+
Integer.parseInt(rs.getString("amount"));

%>

<tr>

<td><%=rs.getString("cartid")%></td>

<td><%=rs.getString("productid")%></td>

<td><%=rs.getString("productname")%></td>

<td><%=rs.getString("price")%></td>

<td><%=rs.getString("quantity")%></td>

<td><%=rs.getString("amount")%></td>

<td>

<a href="deletecart.jsp?id=<%=rs.getString("cartid")%>">
Remove
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

<br><br>

<h3>Total Amount : Rs. <%=total%></h3>

<br>

<form action="PlaceOrderServlet">

<input type="submit"
value="Place Order">

</form>

</center>

</body>
</html>