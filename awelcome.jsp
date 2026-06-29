<html>
<head>
<title>Welcome</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:linear-gradient(to right,#3ac9a5,#43ddf5);
    color:white;
}

.header{
    padding:25px;
    text-align:center;
}

h1{
    margin:0;
    font-size:40px;
    text-shadow:2px 2px 5px black;
}

.welcome{
    margin-top:15px;
    font-size:22px;
    font-weight:bold;
}

</style>

</head>

<body>

<%
String name=(String)session.getAttribute("name");
%>

<div class="header">

<h1>AGRICULTURE MARKET PLACE</h1>

<div class="welcome">
Welcome, <%=name%>
</div>

</div>

</body>
</html>