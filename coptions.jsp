<html>
    <head><style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to bottom, #fdfcfb, #e2d1c3);
    text-align:center;
}

/* Title */
h2{
    color:#333;
    margin-top:25px;
    letter-spacing:1px;
}

/* Menu links (reduced spacing) */
a{
    display:block;
    width:260px;
    margin:6px auto;   /* reduced spacing */
    padding:10px 18px;
    text-decoration:none;
    font-size:15px;
    font-weight:bold;
    color:white;
    background:linear-gradient(to right, #206a74, #3ad0db);
    border-radius:10px;
    box-shadow:0 6px 14px rgba(0,0,0,0.12);
    transition:0.3s;
}

/* Hover effect */
a:hover{
    transform:scale(1.04);
    background:linear-gradient(to right, #140a1f, #2e3968);
    box-shadow:0 10px 20px rgba(0,0,0,0.2);
}

/* Logout button */
a[href="index.jsp"]{
    background:linear-gradient(to right, #840c28, #c97721);
}

a[href="index.jsp"]:hover{
    background:linear-gradient(to right, #8a4135, #dea843);
}

hr{
    width:60%;
    border:1px solid #ccc;
    margin-bottom:15px;
}

</style></head>
<body bgcolor="wheat">
<center>
<h2>CUSTOMER MENU</h2>
<h2>
<hr>
<a href="searchproduct.jsp" target="f3">
Search and Filter Products
</a>
<a href="viewcart.jsp" target="f3">
View Cart and Place order
</a>

<a href="MyOrdersServlet" target="f3">
View Order and Track Orders
</a>

<a href="RateReview.jsp" target="f3">
Rate and Review products
</a>

<a href="complaint.jsp" target="f3">
Complaint Box
</a>

<a href="logout.jsp" target="_top">
Logout
</a>
</h2>
</center>

</body>
</html>