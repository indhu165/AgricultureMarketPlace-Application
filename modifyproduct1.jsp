<html>
    <head><style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #c9d6ff, #e2e2e2);
}

center{
    margin-top:40px;
}

h2{
    color:#333;
    margin-bottom:20px;
    letter-spacing:1px;
}

/* Table styling */
table{
    border-collapse:collapse;
    background:white;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
    border-radius:10px;
    overflow:hidden;
}

th{
    background:linear-gradient(to right, #4facfe, #00f2fe);
    color:white;
    padding:12px 15px;
    text-align:left;
    font-size:14px;
}

td{
    padding:10px 15px;
}

/* Inputs */
input[type="text"]{
    width:250px;
    padding:10px;
    border:2px solid #ddd;
    border-radius:8px;
    outline:none;
    transition:0.3s;
    font-size:14px;
}

input[type="text"]:focus{
    border-color:#4facfe;
    box-shadow:0 0 6px rgba(79,172,254,0.4);
}

/* Button */
input[type="submit"]{
    margin-top:15px;
    background:linear-gradient(to right, #43e97b, #38f9d7);
    border:none;
    padding:12px 30px;
    color:white;
    font-size:16px;
    border-radius:8px;
    cursor:pointer;
    transition:0.3s;
}

input[type="submit"]:hover{
    transform:scale(1.05);
    box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

</style></head>
<body>

<center>

<h2>UPDATE PRODUCT</h2>

<form action="UpdateProductServlet">

<table border="1">

<tr>
<th>Product ID</th>
<td>
<input type="text"
name="t1"
value="<%=request.getAttribute("id")%>"
readonly>
</td>
</tr>

<tr>
<th>Product Name</th>
<td>
<input type="text"
name="t2"
value="<%=request.getAttribute("name")%>">
</td>
</tr>

<tr>
<th>Category</th>
<td>
<input type="text"
name="t3"
value="<%=request.getAttribute("category")%>">
</td>
</tr>

<tr>
<th>Quantity</th>
<td>
<input type="text"
name="t4"
value="<%=request.getAttribute("qty")%>">
</td>
</tr>

<tr>
<th>Price</th>
<td>
<input type="text"
name="t5"
value="<%=request.getAttribute("price")%>">
</td>
</tr>

<tr>
<th>Description</th>
<td>
<input type="text"
name="t6"
value="<%=request.getAttribute("desc")%>">
</td>
</tr>

</table>

<br>

<input type="submit"
value="UPDATE">

</form>

</center>

</body>
</html>