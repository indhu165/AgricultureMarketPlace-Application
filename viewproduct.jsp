<html>
<head>
    <style>
    body{
        margin:0;
        padding:0;
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #f5f7fa, #c3cfe2);
    }

    h2{
        margin-top: 20px;
        color: #2c3e50;
        background: #ffffff;
        display: inline-block;
        padding: 10px 25px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
    }

    table{
        margin-top: 30px;
        border-collapse: collapse;
        width: 95%;
        background: #ffffff;
        box-shadow: 0px 5px 20px rgba(0,0,0,0.15);
        border-radius: 10px;
        overflow: hidden;
    }

    th{
        background: #28b4c6;
        color: white;
        padding: 12px;
        font-size: 15px;
        text-transform: uppercase;
    }

    td{
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        color: #2c3e50;
    }

    tr:nth-child(even){
        background-color: #f2f6fc;
    }

    tr:hover{
        background-color: #dfefff;
        transition: 0.3s;
    }

    img{
        border-radius: 8px;
        box-shadow: 0px 3px 8px rgba(0,0,0,0.2);
    }

    a{
        text-decoration: none;
        color: white;
        background: #e74c3c;
        padding: 6px 12px;
        border-radius: 6px;
        font-size: 13px;
    }

    a:hover{
        background: #c0392b;
    }

    .container{
        width: 100%;
        text-align: center;
        padding: 20px;
    }
</style>
</head>

<body bgcolor="pink">

<center>
<h2>PRODUCT DETAILS</h2>

<%@ page import="java.sql.*"%>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

PreparedStatement pst1=
con.prepareStatement(
"select count(*) from product where status='Active'");

ResultSet rs1=pst1.executeQuery();

rs1.close();
pst1.close();
con.close();
}
catch(Exception e)
{
out.println(e);
}
%>

<table border="1">

<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>Category</th>
<th>Quantity</th>
<th>Price</th>
<th>Description</th>
<th>Image</th>
<th>Date</th>
<th>Delete</th>
</tr>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con=
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test",
"root",
"Indu@1525");

String fid =
session.getAttribute("id").toString();

PreparedStatement pst =
con.prepareStatement(
"select * from product where userid=?");

pst.setString(1,fid);

ResultSet rs =
pst.executeQuery();

while(rs.next())
{
out.println("<tr>");

out.println("<td>"+rs.getString(1)+"</td>");
out.println("<td>"+rs.getString(2)+"</td>");
out.println("<td>"+rs.getString(3)+"</td>");
out.println("<td>"+rs.getString(4)+"</td>");
out.println("<td>"+rs.getString(5)+"</td>");
out.println("<td>"+rs.getString(6)+"</td>");

String img=rs.getString(7);

out.println(
"<td><img src='"+img+
"' width='100' height='100'></td>");

out.println("<td>"+rs.getString(8)+"</td>");

out.println(
"<td><a href='deleteproduct.jsp?id="
+rs.getString(1)+
"' onclick=\"return confirm('Are you sure you want to delete this product?')\">Delete</a></td>");

out.println("</tr>");
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

</table>

<br><br>

</center>

</body>
</html>