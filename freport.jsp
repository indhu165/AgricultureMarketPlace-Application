<%@page import="java.sql.*"%>

<html>
<head>
    <style>
body{
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #ffe6f0, #ffd1dc);
    text-align: center;
}

/* Title */
h2{
    background: #ff2e7a;
    color: white;
    padding: 12px 25px;
    display: inline-block;
    border-radius: 10px;
    margin-top: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

/* DASHBOARD BOXES */
.box{
    display: inline-block;
    width: 180px;
    margin: 15px;
    padding: 20px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.15);
    font-size: 15px;
    font-weight: bold;
    color: #333;
    transition: 0.3s;
}

.box:hover{
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.25);
}

/* CATEGORY TABLE */
table{
    border-collapse: collapse;
    width: 50%;
    margin-top: 20px;
    background: white;
    box-shadow: 0 6px 15px rgba(0,0,0,0.15);
    border-radius: 10px;
    overflow: hidden;
}

th{
    background: #ff2e7a;
    color: white;
    padding: 12px;
    font-size: 14px;
}
.row{
    display: flex;
    justify-content: center;
    gap: 30px;
    margin: 25px 0;
    flex-wrap: wrap;
}

td{
    padding: 12px;
    font-size: 14px;
    color: #333;
    border-bottom: 1px solid #f2f2f2;
}

tr:nth-child(even){
    background: #fff0f5;
}

tr:hover{
    background: #ffe0eb;
    transition: 0.3s;
}
</style>
</head>
<body bgcolor="pink">
<center>
<h2>GENERATE REPORTS AND ANALYTICS</h2>
<%
int farmers=0;
int customers=0;
int products=0;
int orders=0;
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
"select count(*) from user");

ResultSet rs1=
pst1.executeQuery();

if(rs1.next())
{
farmers=rs1.getInt(1);
}

PreparedStatement pst2=
con.prepareStatement(
"select count(*) from customer");

ResultSet rs2=
pst2.executeQuery();

if(rs2.next())
{
customers=rs2.getInt(1);
}

PreparedStatement pst3=
con.prepareStatement(
"select count(*) from product where status='Available'");

ResultSet rs3=
pst3.executeQuery();

if(rs3.next())
{
products=rs3.getInt(1);
}

PreparedStatement pst4=
con.prepareStatement(
"select count(*) from orders");

ResultSet rs4=
pst4.executeQuery();

if(rs4.next())
{
orders=rs4.getInt(1);
}

PreparedStatement pst5=
con.prepareStatement(
"select sum(amount) from orders where status='Accepted'");

ResultSet rs5=
pst5.executeQuery();

if(rs5.next())
{
revenue=rs5.getInt(1);
}

con.close();
}
catch(Exception e)
{
out.println(e);
}
%>

<div class="row">

    <div class="box">
        Total Farmers
        <br><br>
        <%=farmers%>
    </div>

    <div class="box">
        Total Customers
        <br><br>
        <%=customers%>
    </div>

</div>

<div class="row">

    <div class="box">
        Available Products
        <br><br>
        <%=products%>
    </div>

    <div class="box">
        Total Orders
        <br><br>
        <%=orders%>
    </div>

    <div class="box">
        Total Revenue
        <br><br>
        RS. <%=revenue%>
    </div>

</div>
</center>

<br><br>

<center>
<h2>Category Wise Products</h2>

<table border="1" width="50%" cellpadding="10">

<tr>
<th><font color="black">Category</font></th>
<th><font color="black">Total Products</font></th>
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
"select category,count(*) from product group by category");

ResultSet rs=
pst.executeQuery();

while(rs.next())
{
%>

<tr align="center">
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
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