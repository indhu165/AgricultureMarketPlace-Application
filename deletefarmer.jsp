<%@ page import="java.sql.*" %>

<%
try
{
    String id=request.getParameter("id");

    Class.forName("com.mysql.jdbc.Driver");

    Connection con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/test",
    "root",
    "Indu@1525");

    PreparedStatement pst=
    con.prepareStatement(
    "delete from user where userid=?");

    pst.setString(1,id);

    int x=pst.executeUpdate();

    if(x>0)
    {
        out.println("Farmer Deleted Successfully");
    }
    else
    {
        out.println("Farmer Not Found");
    }

    pst.close();
    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>

<br><br>

<a href="viewfarmer.jsp">Back to View Farmers</a>