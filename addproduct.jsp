<html>
<head>
<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #f5f0e6, #e8f5e9);
}

/* Title */
h2{
    background:#f7f4f6;
    color:rgb(2, 2, 2);
    padding:12px 25px;
    display:inline-block;
    border-radius:10px;
    margin-top:20px;
    box-shadow:0 4px 10px rgba(0,0,0,0.2);
}

/* FORM TABLE CONTAINER */
table{
    margin-top:20px;
    background:white;
    border-collapse:collapse;
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
    border-radius:10px;
    overflow:hidden;
}

/* CELLS */
th{
    padding:12px;
    background:#28b4c6;
    color:white;
    font-size:14px;
    text-align:left;
}

td{
    padding:12px;
    font-size:14px;
}

/* INPUT FIELDS */
input[type="text"],
select,
textarea,
input[type="file"]{
    width:250px;
    padding:8px;
    border:1px solid #ccc;
    border-radius:6px;
    outline:none;
    transition:0.3s;
}

input:focus,
select:focus,
textarea:focus{
    border-color:#2e8e97;
    box-shadow:0 0 5px rgba(46,125,50,0.5);
}

/* TEXTAREA */
textarea{
    height:80px;
    resize:none;
}

/* SUBMIT BUTTON */
input[type="submit"]{
    margin-top:20px;
    padding:10px 25px;
    background:#15adc5;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-size:15px;
    transition:0.3s;
}

input[type="submit"]:hover{
    background:#1b5e20;
    transform:scale(1.05);
}

/* CENTER EFFECT */
center{
    margin-top:20px;
}
</style>
</head>

<body bgcolor="pink">

<center>

<h2>ADD PRODUCT</h2>

<form action="AddProductServlet" method="post">

<%@ page import="java.sql.*"%>

<%
int no=0;

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
"select max(productid) from product");

ResultSet rs=pst.executeQuery();

if(rs.next())
{
try
{
no=Integer.parseInt(rs.getString(1))+1;
}
catch(Exception e)
{
no=101;
}
}
}
catch(Exception e)
{
no=101;
}
%>

<table border="1">

<tr>
<th>Product Id</th>
<td>
<input type="text"
name="t1"
value="<%=no%>"
readonly>
</td>
</tr>

<tr>
<th>Product Name</th>
<td>
<input type="text"
name="t2">
</td>
</tr>

<tr>
<th>Category</th>
<td>
<select name="t3">
<option>Rice</option>
<option>Wheat</option>
<option>Vegetables</option>
<option>Fruits</option>
<option>Pulses</option>
</select>
</td>
</tr>

<tr>
<th>Quantity</th>
<td>
<input type="text"
name="t4">
</td>
</tr>

<tr>
<th>Price</th>
<td>
<input type="text"
name="t5">
</td>
</tr>

<tr>
<th>Description</th>
<td>
<textarea name="t6"></textarea>
</td>
</tr>

<tr>
<th>Product Image</th>
<td>
<input type="file"
name="t7">
</td>
</tr>

<tr>
<th>Date</th>

<%
java.text.SimpleDateFormat sd=
new java.text.SimpleDateFormat("dd-MM-yyyy");

String str=
sd.format(new java.util.Date());
%>

<td>
<input type="text"
name="t8"
value="<%=str%>"
readonly>
</td>
</tr>

</table>

<br>

<input type="submit"
value="ADD PRODUCT">

</form>

</center>

</body>
</html>