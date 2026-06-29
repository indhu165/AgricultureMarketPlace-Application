<html>
    <head><style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background: linear-gradient(to right, #74ebd5, #acb6e5);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    text-align:center;
}

/* Main heading */
h1{
    color:#fff;
    font-size:40px;
    margin-bottom:10px;
    text-shadow:2px 2px 8px rgba(0,0,0,0.3);
}

/* Welcome text */
h3{
    color:#fff;
    font-size:20px;
    font-weight:normal;
    background:rgba(0,0,0,0.2);
    padding:12px 20px;
    border-radius:10px;
    display:inline-block;
    margin-top:10px;
    box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

</style></head>
<body bgcolor="lightblue">

<center>

<h1>WELCOME CUSTOMER</h1>

<h3>
Welcome :
<%=session.getAttribute("name")%>
</h3>

</center>

</body>
</html>