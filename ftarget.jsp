<html>
<head>
<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #dbeafe, #fff1f2);
}

/* MAIN CARD */
.container{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* WELCOME BOX */
.card{
    width:600px;
    padding:40px;
    text-align:center;
    background:white;
    border-radius:20px;
    box-shadow:0 10px 30px rgba(0,0,0,0.2);
    animation: fadeIn 1s ease-in-out;
}

/* TITLE */
h1{
    font-size:28px;
    color:#2c3e50;
    margin-bottom:10px;
}

/* SUB TEXT */
p{
    font-size:16px;
    color:#555;
    line-height:1.6;
}

/* HIGHLIGHT BOX */
.highlight{
    margin-top:20px;
    padding:15px;
    background: linear-gradient(135deg, #ff4d88, #ff1a75);
    color:white;
    border-radius:12px;
    font-weight:bold;
}

/* ANIMATION */
@keyframes fadeIn{
    from{opacity:0; transform:translateY(-20px);}
    to{opacity:1; transform:translateY(0);}
}
</style>
</head>

<body>

<div class="container">

<div class="card">

<h1> Welcome to Agriculture Marketplace System</h1>

<%
    String user = (String)session.getAttribute("id");
%>

<p>
Hello <b><%= user %></b>, welcome to your dashboard.
This platform helps farmers manage products, track sales, and connect with customers easily.
</p>

<div class="highlight">
Empowering Farmers with Digital Technology 
</div>

</div>

</div>

</body>
</html>