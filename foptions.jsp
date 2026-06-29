<html>
<head>
<style>
body{
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #fdfbfb, #ebedee);
}

/* MAIN MENU BOX */
.menu{
    width: 320px;
    margin: 60px auto;
    padding: 25px;
    background: white;
    border-radius: 18px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    text-align: center;
}

/* TITLE */
h1{
    font-size: 20px;
    color: #150d30;
    margin-bottom: 20px;
    letter-spacing: 1px;
}

/* LINKS */
a{
    display: block;
    text-decoration: none;
    background: linear-gradient(135deg, #3d0e1c, #ff1a75);
    color: white;
    padding: 12px;
    margin: 12px 0;
    border-radius: 12px;
    font-size: 14px;
    font-weight: bold;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

/* HOVER EFFECT */
a:hover{
    background: linear-gradient(135deg, #0c1d33, #ad1457);
    transform: translateY(-3px);
    box-shadow: 0 8px 18px rgba(0,0,0,0.2);
}

/* LOGOUT BUTTON */
a[href*="index.jsp"]{
    background: linear-gradient(135deg, #130b20, #230808);
}

a[href*="index.jsp"]:hover{
    background: linear-gradient(135deg, #0a1832, #7f0000);
}

/* MENU CONTAINER WRAP FIX */
.container{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
</style>
</head>

<body>

<div class="container">

<div class="menu">

<h1>FARMER DASHBOARD</h1>

<a href="finfo.jsp" target="f3">Add / Update Agricultural Products</a>

<a href="fmanage.jsp" target="f3">Manage Product Pricing & Stock</a>

<a href="viewcustomerorders.jsp" target="f3"> View Customer Orders</a>

<a href="fsales.jsp" target="f3">Track Sales & Earnings</a>

<a href="complaint.jsp" target="f3"> Complaint Box</a>

<a href="ViewReviews.jsp" target="f3"> View Reviews</a>

<a href="logout.jsp" target="_top">Logout</a>

</div>

</div>

</body>
</html>