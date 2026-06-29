<%@ page import="java.sql.*" %>

<html>
<head>
    <style>
body{
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(135deg,#74ebd5,#ACB6E5);
    margin:0;
    padding:30px;
}

h2{
    color:#2c3e50;
    font-size:30px;
    margin-bottom:25px;
}

table{
    width:95%;
    background:white;
    border-collapse:collapse;
    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
    border-radius:15px;
    overflow:hidden;
}

th{
    background:#3498db;
    color:white;
    padding:15px;
    font-size:16px;
}

td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tr:nth-child(even){
    background:#f8f9fa;
}

tr:hover{
    background:#eaf4ff;
}

a{
    background:#dc3545;
    color:white;
    padding:8px 15px;
    text-decoration:none;
    border-radius:5px;
    font-weight:bold;
}

a:hover{
    background:#c82333;
    transition:0.3s;
}
</style>
</head>
<body>

<center>

<h2>VIEW CUSTOMERS</h2>

<%
try
{
    Class.forName("com.mysql.jdbc.Driver");

    Connection con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/test",
    "root",
    "Indu@1525");

    String id=request.getParameter("id");

    if(id!=null)
    {
        PreparedStatement pst1=
        con.prepareStatement(
        "delete from customer where userid=?");

        pst1.setString(1,id);
        pst1.executeUpdate();
    }
%>

<table border="1">

<tr>
<th>Customer Id</th>
<th>Name</th>
<th>Phone</th>
<th>Email</th>
<th>DOB</th>
<th>Gender</th>
<th>Address</th>
<th>Password</th>
<th>Action</th>
</tr>

<%
    PreparedStatement pst=
    con.prepareStatement("select * from customer");

    ResultSet rs=pst.executeQuery();

    while(rs.next())
    {
%>

<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>

<td>
<a href="ViewCustomer.jsp?id=<%=rs.getString(1)%>"
onclick="return confirm('Are you sure to delete this customer?')">
Delete
</a>
</td>

</tr>

<%
    }

    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>

</table>

</center>

</body>
</html>