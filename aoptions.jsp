<html>
<head>
<title>Admin Options</title>

<style>

body{
    margin:0;
    padding:20px;
    font-family:Arial;
    background:#f4f6f9;
}

.menu{
    width:90%;
    margin:auto;
}

.menu a{
    display:block;
    text-decoration:none;
    background:white;
    color:#333;
    padding:18px;
    margin-bottom:15px;
    border-radius:12px;
    font-size:20px;
    font-weight:bold;
    box-shadow:0px 3px 10px rgba(0,0,0,0.2);
    transition:0.3s;
}

.menu a:hover{
    background:#2d9da5;
    color:white;
    transform:translateX(8px);
}

.logout{
    background:#190f2e !important;
    color:white !important;
}

.logout:hover{
    background:#c61616 !important;
}

</style>

</head>

<body>

<div class="menu">

<a href='ainfo.jsp' target="f3">
 Manage Users and Product Listings
</a>

<a href='paymentinfo.jsp' target="f3">
Monitor Orders and Payments
</a>

<a href='freport.jsp' target="f3">
 Generate Reports and Analytics
</a>

<a href='viewcomplaints.jsp' target="f3">
View Complaints
</a>

<a href='logout.jsp' target="_top" class="logout">
Logout
</a>

</div>

</body>
</html>