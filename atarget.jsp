<html>
<head>
<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #ece9e6, #ffffff);
}

.container{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.card{
    width:650px;
    padding:40px;
    text-align:center;
    background:white;
    border-radius:20px;
    box-shadow:0 10px 35px rgba(0,0,0,0.25);
    animation: fadeIn 1s ease-in-out;
}

h1{
    font-size:30px;
    color:#1c1c1c;
    margin-bottom:10px;
}

p{
    font-size:16px;
    color:#555;
    line-height:1.6;
}

.highlight{
    margin-top:20px;
    padding:15px;
    background: linear-gradient(135deg, #ff4d4d, #b71c1c);
    color:white;
    border-radius:12px;
    font-weight:bold;
}

.adminTag{
    display:inline-block;
    margin-bottom:15px;
    padding:6px 12px;
    background:#2c3e50;
    color:white;
    border-radius:8px;
    font-size:13px;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(-20px);}
    to{opacity:1; transform:translateY(0);}
}
</style>
</head>

<body>

<div class="container">

<div class="card">

<div class="adminTag">ADMIN PANEL</div>

<h1> Welcome Administrator</h1>

<%
    String user = (String)session.getAttribute("id");
%>

<p>
Hello <b><%= user %></b>, welcome to the Agriculture Management System.
You have full control over users, products, orders, and system monitoring.
</p>

<div class="highlight">
System Control & Management Center
</div>

</div>

</div>

</body>
</html>