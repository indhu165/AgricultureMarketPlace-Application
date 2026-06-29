<html>
<head>
<title>Customer Dashboard</title>

<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #e0f7fa, #fffde7);
}

.container{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.card{
    width:600px;
    padding:40px;
    text-align:center;
    background:white;
    border-radius:20px;
    box-shadow:0 10px 30px rgba(0,0,0,0.2);
    animation: fadeIn 1s ease-in-out;
}

h1{
    font-size:28px;
    color:#2c3e50;
}

p{
    font-size:16px;
    color:#555;
    line-height:1.6;
}

.highlight{
    margin-top:20px;
    padding:15px;
    background: linear-gradient(135deg, #42a5f5, #1e88e5);
    color:white;
    border-radius:12px;
    font-weight:bold;
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

<h1> Welcome Customer</h1>

<%
    String user = (String)session.getAttribute("id");
    if(user == null){
        user = "Guest";
    }
%>

<p>
Hello <b><%= user %></b>, welcome to the Agriculture Marketplace.
You can explore fresh farm products and enjoy direct buying from farmers.
</p>

<div class="highlight">
Fresh from Farm to Your Home 
</div>

</div>

</div>

</body>
</html>