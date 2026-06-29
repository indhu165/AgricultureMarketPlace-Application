<html>
<body bgcolor="pink">
    <head>
<style>
body{
    margin:0;
    padding:0;
    font-family:Arial, Helvetica, sans-serif;
    background:linear-gradient(135deg,#74ebd5,#ACB6E5);
}

.container{
    width:400px;
    margin:120px auto;
    background:white;
    padding:40px;
    border-radius:15px;
    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
    text-align:center;
}

h2{
    color:#2c3e50;
    margin-bottom:30px;
}

label{
    font-size:18px;
    color:#555;
    font-weight:bold;
}

input[type=text]{
    width:90%;
    padding:12px;
    margin-top:15px;
    margin-bottom:25px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:16px;
    outline:none;
}

input[type=text]:focus{
    border-color:#3498db;
    box-shadow:0px 0px 8px rgba(52,152,219,0.5);
}

input[type=submit]{
    background:#3498db;
    color:white;
    border:none;
    padding:12px 30px;
    font-size:16px;
    border-radius:8px;
    cursor:pointer;
    transition:0.3s;
}

input[type=submit]:hover{
    background:#2980b9;
    transform:scale(1.05);
}
</style>
</head>

<center>
<h2>SEARCH FARMER</h2>
<form action="modifyfarmer1.jsp">
Search By User ID:
<input type="text" name="userid">
<input type="submit" value="Search">
</form>
</center>

</body>
</html>