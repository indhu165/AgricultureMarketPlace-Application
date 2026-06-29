<html>
    <head><style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #ffdde1, #ee9ca7);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

h2{
    color:#333;
    margin-bottom:20px;
    letter-spacing:1px;
}

form{
    background:white;
    padding:40px 50px;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
    text-align:center;
    width:350px;
}

input[type="text"]{
    width:90%;
    padding:12px;
    margin-top:10px;
    margin-bottom:20px;
    border:2px solid #ddd;
    border-radius:10px;
    outline:none;
    font-size:14px;
    transition:0.3s;
}

input[type="text"]:focus{
    border-color:#ff5e62;
    box-shadow:0 0 8px rgba(255,94,98,0.3);
}

input[type="submit"]{
    background: linear-gradient(to right, #ff5e62, #ff9966);
    border:none;
    padding:12px 25px;
    color:white;
    font-size:16px;
    border-radius:10px;
    cursor:pointer;
    transition:0.3s;
}

input[type="submit"]:hover{
    transform:scale(1.05);
    box-shadow:0 8px 15px rgba(0,0,0,0.2);
}

</style></head>
<body bgcolor="pink">

<center>

<h2>MODIFY PRODUCT</h2>

<form action="SearchProductServlet">

Product ID :

<input type="text" name="pid">

<input type="submit" value="Search">

</form>

</center>

</body>
</html>