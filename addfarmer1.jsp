
<html>
<head>
<title>Farmer Registration Success</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:linear-gradient(to right,#071b07,#81C784);
}

.box{
    width:500px;
    background:white;
    margin:120px auto;
    padding:40px;
    border-radius:20px;
    text-align:center;
    box-shadow:0px 0px 20px gray;
}

h1{
    color:#2E7D32;
    font-size:30px;
}

a{
    text-decoration:none;
    background:#e159b6;
    color:white;
    padding:12px 25px;
    border-radius:8px;
    font-size:18px;
}

a:hover{
    background:#2E7D32;
}

</style>

</head>

<body>

<div class="box">

<%@ page import="java.sql.*"%>

<%
try
{
String s1=request.getParameter("t1");
String s2=request.getParameter("t2");
String s3=request.getParameter("t3");
String s4=request.getParameter("t4");
String s5=request.getParameter("t5");
String s6=request.getParameter("t6");
String s7=request.getParameter("t7");
String s8=request.getParameter("t8");
String s9=request.getParameter("t9");

Class.forName("com.mysql.jdbc.Driver");

Connection con =
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst =
con.prepareStatement(
"insert into user values(?,?,?,?,?,?,?,?,?,?)");

pst.setString(1,s1);
pst.setString(2,s2);
pst.setString(3,s3);
pst.setString(4,s4);
pst.setString(5,s5);
pst.setString(6,s6);
pst.setString(7,s7);
pst.setString(8,s8);
pst.setString(9,s9);
pst.setString(10,"Active");

int x = pst.executeUpdate();

if(x>0)
{
%>

<h1>Registration Successful</h1>

<br>

<h2>Your User ID is : <%=s1%></h2>

<br><br>

<a href="addfarmer.jsp">Back</a>

<%
}
else
{
%>

<h1>Registration Failed</h1>

<br><br>

<a href="addfarmer.jsp">Try Again</a>

<%
}

pst.close();
con.close();
}
catch(Exception e)
{
out.println("<h2>"+e+"</h2>");
}
%>

</div>

</body>
</html>
```
