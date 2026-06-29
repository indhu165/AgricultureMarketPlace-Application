<html>
<head>

<title>Admin Information</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:linear-gradient(to right,#f5f7fa,#c3cfe2);
}

.container{
    width:700px;
    margin:50px auto;
    background:white;
    border-radius:20px;
    box-shadow:0px 0px 20px gray;
    padding:40px;
}

h2{
    text-align:center;
    color:#0d0d36;
    margin-bottom:40px;
}

.menu{
    display:flex;
    flex-direction:column;
    gap:20px;
}

.menu a{
    text-decoration:none;
    background:#36ada3;
    color:white;
    padding:18px;
    border-radius:10px;
    font-size:22px;
    text-align:center;
    transition:0.3s;
}

.menu a:hover{
    background:#05071b;
    transform:scale(1.03);
}

</style>

</head>

<body>

<div class="container">

<h2>ADMIN MANAGEMENT PANEL</h2>

<div class="menu">

<a href='Farmerinfo.jsp' target="f3">
Manage Farmer/Seller
</a>

<a href='custinfo.jsp' target="f3">
     Manage Buyer/Customer
</a>

<a href='viewadminproduct.jsp' target="f3">Product listings</a><br>

</div>

</div>

</body>
</html>
```
