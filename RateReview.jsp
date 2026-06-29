<html>
<head>
<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:linear-gradient(to right, #fbc2eb, #a6c1ee);
}

/* Title */
h2{
    margin-top:30px;
    color:#333;
    letter-spacing:1px;
}

/* Form Table */
table{
    margin:25px auto;
    background:white;
    border-collapse:collapse;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

/* Headers */
th{
    background:linear-gradient(to right, #6096a8, #1e7985);
    color:white;
    padding:12px;
    text-align:left;
    width:150px;
}

/* Cells */
td{
    padding:12px;
}

/* Text fields */
input[type="text"],
select,
textarea{
    width:250px;
    padding:10px;
    border:2px solid #ddd;
    border-radius:8px;
    outline:none;
    font-size:14px;
    transition:0.3s;
}

/* Textarea */
textarea{
    height:80px;
    resize:none;
}

/* Focus effect */
input[type="text"]:focus,
select:focus,
textarea:focus{
    border-color:#667eea;
    box-shadow:0 0 8px rgba(102,126,234,0.3);
}

/* Submit button */
input[type="submit"]{
    background:linear-gradient(to right, #43cea2, #185a9d);
    color:white;
    border:none;
    padding:12px 25px;
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

<h2>RATE AND REVIEW PRODUCT</h2>

<form action="RateReviewServlet">

<table border="1">

<tr>
<th>Product ID</th>
<td>
<input type="text" name="pid">
</td>
</tr>

<tr>
<th>Product Name</th>
<td>
<input type="text" name="pname">
</td>
</tr>

<tr>
<th>Rating</th>
<td>
<select name="rating">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
</select>
</td>
</tr>

<tr>
<th>Review</th>
<td>
<textarea name="review"></textarea>
</td>
</tr>

</table>

<br>

<input type="submit"
value="Submit Review">

</form>

</center>

</body>
</html>