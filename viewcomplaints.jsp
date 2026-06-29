<%@ page import="java.sql.*" %>

<html>
    <head><style>
body{
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #ffe6f0, #ffd1dc);
    text-align: center;
}

/* Title */
h2{
    background: #ff2e7a;
    color: white;
    padding: 12px 25px;
    display: inline-block;
    border-radius: 10px;
    margin-top: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

/* TABLE DESIGN */
table{
    border-collapse: collapse;
    width: 90%;
    margin-top: 10px;
    background: white;
    box-shadow: 0 6px 15px rgba(0,0,0,0.15);
    border-radius: 10px;
    overflow: hidden;
}

/* HEADER */
th{
    background: #ff2e7a;
    color: white;
    padding: 12px;
    font-size: 14px;
    text-transform: uppercase;
}

/* CELLS */
td{
    padding: 52px;
    font-size: 14px;
    color: #333;
    border-bottom: 1px solid #f2f2f2;
}

/* STRIPED ROWS */
tr:nth-child(even){
    background: #fff0f5;
}

/* HOVER EFFECT */
tr:hover{
    background: #ffe0eb;
    transition: 0.3s;
}

/* STATUS COLUMN HIGHLIGHT (optional nice touch) */
td:last-child{
    font-weight: bold;
}

/* RESPONSIVE SCROLL (important for big tables) */
table{
    display: block;
    overflow-x: auto;
    white-space: nowrap;
}
</style></head>
<body bgcolor="pink">

<center>

<h2>Complaints</h2>

<table border="1" width="90%">

<tr>
<th>ID</th>
<th>User ID</th>
<th>Name</th>
<th>User Type</th>
<th>Complaint</th>
<th>Date</th>
<th>Status</th>
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

PreparedStatement pst=
con.prepareStatement(
"select * from complaint");

ResultSet rs=
pst.executeQuery();

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