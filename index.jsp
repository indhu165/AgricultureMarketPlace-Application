<html>
<head>
<title>Agriculture Market Place</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background-image:url('farm.jpg');
    background-size:cover;
    background-repeat:no-repeat;
    background-position:center;
}

h1{
    color:white;
    text-align:center;
    padding-top:30px;
    font-size:45px;
    text-shadow:3px 3px 5px black;
}

.loginbox{
    width:400px;
    background:rgba(255,255,255,0.9);
    margin:auto;
    margin-top:50px;
    padding:30px;
    border-radius:20px;
    box-shadow:0px 0px 20px black;
}

table{
    width:100%;
}

th{
    font-size:20px;
    padding:15px;
}

td{
    padding:15px;
}

input[type=text],
input[type=password],
select{
    width:100%;
    padding:10px;
    border-radius:8px;
    border:1px solid gray;
}

input[type=submit]{
    background:green;
    color:white;
    border:none;
    padding:12px 25px;
    border-radius:10px;
    font-size:18px;
    cursor:pointer;
}

input[type=submit]:hover{
    background:darkgreen;
}

a{
    text-decoration:none;
    color:blue;
    font-size:18px;
}

a:hover{
    color:red;
}

.register{
    text-align:center;
    margin-top:20px;
}

</style>

</head>

<body>

<h1>AGRICULTURE MARKET PLACE</h1>

<div class="loginbox">

<form action="Verify.jsp">

<table>

<tr>
<th>User Type</th>
<td>
<select name="t1">
<option>-------SELECT----------</option>
<option>Admin</option>
<option>Farmer/Seller</option>
<option>Buyer/User</option>
</select>
</td>
</tr>

<tr>
<th>User Name</th>
<td>
<input type="text" name="t2">
</td>
</tr>

<tr>
<th>Password</th>
<td>
<input type="password" name="t3">
</td>
</tr>

<tr>
<td colspan="2" align="center">
<input type="submit" value="LOGIN">
</td>
</tr>

</table>

<div class="register">
<a href="register.jsp">New User? Register Here</a>
</div>
</form>

</div>

</body>
</html>