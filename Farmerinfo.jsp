<html>
<head>
<title>Manage Farmer/Seller</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:#f4f6f9;
}

.container{
    width:60%;
    margin:60px auto;
    background:white;
    padding:40px;
    border-radius:20px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.2);
    text-align:center;
}

h2{
    color:#1e0f2b;
    margin-bottom:30px;
    font-size:35px;
}

.menu a{
    display:block;
    text-decoration:none;
    background:#42cdaf;
    color:white;
    padding:18px;
    margin:15px 0;
    border-radius:12px;
    font-size:22px;
    font-weight:bold;
    transition:0.3s;
}

.menu a:hover{
    background:#0f0a28;
    transform:scale(1.03);
}

.count{
    color:#FFD700;
    font-weight:bold;
}

</style>

</head>

<body>

<%@ page import="java.sql.*"%>

<%
int c=0;

try
{
    Class.forName("com.mysql.jdbc.Driver");

    Connection con=
    DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/test",
    "root",
    "Indu@1525");

    PreparedStatement pst=
    con.prepareStatement(
    "select count(*) from user where status='Active'");

    ResultSet rs=pst.executeQuery();

    if(rs.next())
    {
        c=rs.getInt(1);
    }
    else
    {
        c=0;
    }

    rs.close();
    pst.close();
    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>

<div class="container">

<h2> Manage Farmer/Seller</h2>

<div class="menu">

<a href="addfarmer.jsp">
Add Farmer/Seller
</a>

<a href="viewfarmer.jsp">
View Farmer/Seller
<span class="count">(<%=c%>)</span>
</a>

<a href="modifyfarmer.jsp">
Modify Farmer/Seller
</a>

<a href="deletefarmer.jsp">
Delete Farmer/Seller
</a>

</div>

</div>

</body>
</html>