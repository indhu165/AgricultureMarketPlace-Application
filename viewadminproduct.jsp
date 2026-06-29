<html>
<head>
<style>
    body{
        margin:0;
        padding:0;
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #ece9e6, #ffffff);
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
        background: #2c3e50;
        color: white;
        padding: 12px;
        font-size: 14px;
        text-transform: uppercase;
    }

    td{
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        color: #2c3e50;
    }

    tr:nth-child(even){
        background-color: #f7f9fc;
    }

    tr:hover{
        background-color: #e8f4ff;
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
        text-align:center;
        padding:20px;
    }
</style>
</head>

<body>

<div class="container">

<h2>ADMIN - ALL PRODUCT DETAILS</h2>

<%@ page import="java.sql.*"%>

<table>

<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>Category</th>
<th>Quantity</th>
<th>Price</th>
<th>Description</th>
<th>Image</th>
<th>Date</th>
<th>Farmer ID</th>
<th>Delete</th>
</tr>

<%
try
{
    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/test",
        "root",
        "Indu@1525"
    );

    // 🔥 ADMIN QUERY: NO USER FILTER
    PreparedStatement pst = con.prepareStatement(
        "select * from product"
    );

    ResultSet rs = pst.executeQuery();

    while(rs.next())
    {
        out.println("<tr>");

        out.println("<td>"+rs.getString(1)+"</td>");
        out.println("<td>"+rs.getString(2)+"</td>");
        out.println("<td>"+rs.getString(3)+"</td>");
        out.println("<td>"+rs.getString(4)+"</td>");
        out.println("<td>"+rs.getString(5)+"</td>");
        out.println("<td>"+rs.getString(6)+"</td>");

        String img = rs.getString(7);

        out.println("<td><img src='"+img+"' width='80' height='80'></td>");

        out.println("<td>"+rs.getString(8)+"</td>");

        // 👇 Important: show farmer/user id also
        out.println("<td>"+rs.getString(9)+"</td>");

        out.println("<td><a href='deleteproduct.jsp?id="
            +rs.getString(1)+
            "' onclick=\"return confirm('Delete this product permanently?')\">Delete</a></td>");

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

</div>

</body>
</html>