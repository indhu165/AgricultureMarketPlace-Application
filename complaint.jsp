<%@ page import="java.sql.*" %>

<html>
    <head><style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #ffdde1, #ee9ca7);
}

/* Title */
h2{
    margin-top:40px;
    color:#333;
    letter-spacing:1px;
}

/* Form table */
table{
    margin:30px auto;
    background:white;
    padding:20px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

/* Labels */
td{
    padding:10px;
    font-size:14px;
    color:#333;
}

/* Textarea */
textarea{
    width:320px;
    padding:12px;
    border:2px solid #ddd;
    border-radius:10px;
    outline:none;
    font-family:Arial;
    font-size:14px;
    transition:0.3s;
    resize:none;
}

textarea:focus{
    border-color:#ff5e62;
    box-shadow:0 0 8px rgba(255,94,98,0.3);
}

/* Submit button */
input[type="submit"]{
    background:linear-gradient(to right, #ff5e62, #ff9966);
    border:none;
    padding:12px 25px;
    color:white;
    font-size:15px;
    border-radius:10px;
    cursor:pointer;
    transition:0.3s;
}

input[type="submit"]:hover{
    transform:scale(1.05);
    box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

</style></head>
<body bgcolor="pink">

<center>

<h2>Send Complaint</h2>

<form action="ComplaintServlet" method="post">

<table>

<tr>
<td>Complaint :</td>
<td>
<textarea name="msg"
rows="6"
cols="40"
required>
</textarea>
</td>
</tr>

<tr>
<td></td>
<td>
<input type="submit"
value="Submit Complaint">
</td>
</tr>

</table>

</form>

</center>

</body>
</html>