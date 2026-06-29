<html>
<head>
<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #ff9a9e, #fad0c4);
}

center{
    margin-top:50px;
}

h2{
    color:#333;
    margin-bottom:20px;
    letter-spacing:1px;
}

/* Form table styling */
table{
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
    border-collapse:collapse;
    min-width:400px;
}

/* Cells */
th, td{
    padding:12px;
    font-size:14px;
}

th{
    text-align:left;
    color:#444;
}

/* Input fields */
input[type="text"],
select{
    width:220px;
    padding:10px;
    border:2px solid #ddd;
    border-radius:8px;
    outline:none;
    transition:0.3s;
    font-size:14px;
    background:#fff;
}

input[type="text"]:focus,
select:focus{
    border-color:#ff6b81;
    box-shadow:0 0 8px rgba(255,107,129,0.3);
}

/* Button */
input[type="submit"]{
    background:linear-gradient(to right, #ff6b81, #ff9472);
    border:none;
    padding:12px 25px;
    color:white;
    font-size:15px;
    border-radius:8px;
    cursor:pointer;
    transition:0.3s;
}

input[type="submit"]:hover{
    transform:scale(1.05);
    box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

</style>
</head>

<body>

<center>

<h2>SEARCH PRODUCTS</h2>

<form action="SearchProductServlet1">

<table border="1">

<tr>
<th>Product Name</th>
<td>
<input type="text" name="pname">
</td>
</tr>

<tr>
<th>Category</th>
<td>
<select name="category">

<option value="">All</option>
<option>Rice</option>
<option>Wheat</option>
<option>Vegetables</option>
<option>Fruits</option>
<option>Pulses</option>

</select>
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