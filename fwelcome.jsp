<html><head><style>
body{
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #cceeff, #e6f7ff);
    text-align: center;
}

/* Title */
h1{
    background: #0e3143;
    color: white;
    padding: 15px 25px;
    display: inline-block;
    border-radius: 12px;
    margin-top: 30px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

/* Welcome text */
p, body{
    font-size: 18px;
}

/* Username highlight */
.welcome{
    margin-top: 20px;
    font-size: 22px;
    font-weight: bold;
    color: #023e8a;
}

/* Card-style center box (optional improvement) */
.container{
    margin-top: 40px;
    display: inline-block;
    padding: 20px 40px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.15);
}
</style></head>
<body bgcolor="lightblue" text="black">
<center><h1>AGRICULTURE MARKET PLACE 
<% 

String name=(String)session.getAttribute("name");
%>
</center>
Welcome <%= name%>,
</body>
</html>