<html>
<head>
<title>Modify Customer</title>
<style>
body{
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(135deg,#74ebd5,#ACB6E5);
    margin:0;
    padding:0;
}

center{
    margin-top:120px;
}

h2{
    color:#2c3e50;
    font-size:30px;
    margin-bottom:30px;
}

table{
    background:white;
    border-collapse:collapse;
    width:400px;
    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
    border-radius:15px;
    overflow:hidden;
}

th{
    background:#3498db;
    color:white;
    padding:15px;
    width:45%;
}

td{
    padding:20px;
    background:#f8f9fa;
    text-align:center;
}

input[type=text]{
    width:90%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:15px;
    outline:none;
}

input[type=text]:focus{
    border-color:#3498db;
    box-shadow:0px 0px 5px rgba(52,152,219,0.5);
}

input[type=submit]{
    background:#28a745;
    color:white;
    border:none;
    padding:12px 30px;
    font-size:16px;
    border-radius:5px;
    cursor:pointer;
}

input[type=submit]:hover{
    background:#218838;
    transform:scale(1.05);
    transition:0.3s;
}
</style>
</head>

<body>

<center>

<h2>MODIFY CUSTOMER</h2>

<form action="ModifyCustomerServlet" method="get">

<table border="1">

<tr>
<th>Enter Customer Id</th>

<td>
<input type="text" name="id">
</td>

</tr>

<tr>

<td colspan="2" align="center">

<input type="submit" value="Search">

</td>

</tr>

</table>

</form>

</center>

</body>
</html>