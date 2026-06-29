<html>
    <head>
        <style>
body{
    margin:0;
    padding:20px;
    font-family:Arial, Helvetica, sans-serif;
    background:linear-gradient(180deg,#2c3e50,#4ca1af);
}

h1{
    margin:0;
    display:flex;
    flex-direction:column;
    gap:20px;
}

a{
    text-decoration:none;
    color:white;
    background:rgba(255,255,255,0.15);
    padding:15px;
    border-radius:10px;
    font-size:22px;
    font-weight:bold;
    transition:0.3s;
    box-shadow:0px 4px 10px rgba(0,0,0,0.2);
}

a:hover{
    background:white;
    color:#2c3e50;
    transform:translateX(8px);
}
</style>
    </head>
<body>
<h1>
<a href='AddCustomer.jsp' target="f3">Add Buyer/customer</a><br>
<a href='ViewCustomer.jsp' target="f3">View Buyer/customer</a><br>
<a href='ModifyCustomer.jsp' target="f3">modify Buyer/customer</a><br>
</h1>
</body>
</html>