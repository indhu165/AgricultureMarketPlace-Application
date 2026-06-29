<%@page import="java.sql.*"%>
<html>
<head>
  <style>
body{
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #ffd1dc, #ffe6f0);
}

h2{
    background: #ff2e7a;
    color: white;
    padding: 12px 25px;
    display: inline-block;
    border-radius: 10px;
    margin-top: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

/* BOX STYLE */
.box{
    width: 200px;
    padding: 10px;
    background: white;
    border-radius: 20px;
    box-shadow: 0 6px 15px rgba(228, 45, 45, 0.15);
    font-size: 16px;
    font-weight: bold;
    color: #333;
    transition: 0.3s;

    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.box:hover{
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.25);
}

/* Table styling */
table{
    width: 90%;
    margin-top: 20px;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 6px 15px rgba(0,0,0,0.15);
    border-radius: 10px;
    overflow: hidden;
}

th{
    background: #ff2e7a;
    color: white;
    padding: 12px;
    text-transform: uppercase;
    font-size: 13px;
}

td{
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #f2f2f2;
    font-size: 14px;
    color: #333;
}
.row{
    display: flex;
    justify-content: center;
    gap: 30px;
    margin: 25px 0;
    flex-wrap: wrap;
}
tr:nth-child(even){
    background: #fff0f5;
}

tr:hover{
    background: #ffe0eb;
    transition: 0.3s;
}

/* Status styling (optional professional touch) */
td:last-child{
    font-weight: bold;
}

</style>
</head>
<body bgcolor="pink">
<center>
<h2>MONITOR ORDERS AND PAYMENTS</h2>

<%
int total=0;
int pending=0;
int accepted=0;
int revenue=0;

try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst1=
con.prepareStatement(
"select count(*) from orders");

ResultSet rs1=
pst1.executeQuery();

if(rs1.next())
{
total=rs1.getInt(1);
}

PreparedStatement pst2=
con.prepareStatement(
"select count(*) from orders where status='Pending'");

ResultSet rs2=
pst2.executeQuery();

if(rs2.next())
{
pending=rs2.getInt(1);
}

PreparedStatement pst3=
con.prepareStatement(
"select count(*) from orders where status='Accepted'");

ResultSet rs3=
pst3.executeQuery();

if(rs3.next())
{
accepted=rs3.getInt(1);
}

PreparedStatement pst4=
con.prepareStatement(
"select sum(amount) from orders where status='Accepted'");

ResultSet rs4=
pst4.executeQuery();

if(rs4.next())
{
revenue=rs4.getInt(1);
}
%>
<div class="row">

    <div class="box">
        Total Orders
        <br><br>
        <%=total%>
    </div>

    <div class="box">
        Pending Orders
        <br><br>
        <%=pending%>
    </div>

</div>

<div class="row">

    <div class="box">
        Accepted Orders
        <br><br>
        <%=accepted%>
    </div>

    <div class="box">
        Revenue
        <br><br>
        Rs <%=revenue%>
    </div>

</div>

<br><br>

<h2>ORDER DETAILS</h2>

<table border="1">

<tr>
<th>Order ID</th>
<th>Customer ID</th>
<th>Product</th>
<th>Quantity</th>
<th>Amount</th>
<th>Date</th>
<th>Status</th>
</tr>

<%
PreparedStatement pst5=
con.prepareStatement(
"select * from orders");

ResultSet rs5=
pst5.executeQuery();

while(rs5.next())
{
%>

<tr>

<td><%=rs5.getString("orderid")%></td>
<td><%=rs5.getString("userid")%></td>
<td><%=rs5.getString("productname")%></td>
<td><%=rs5.getString("quantity")%></td>
<td>Rs <%=rs5.getString("amount")%></td>
<td><%=rs5.getString("orderdate")%></td>
<td><%=rs5.getString("status")%></td>


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