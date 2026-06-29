import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ViewFarmerDetailsServlet
extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException,IOException
    {
        res.setContentType("text/html");

        PrintWriter out=res.getWriter();

        try
        {
            String id=
            req.getParameter("id");

            Class.forName(
            "com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "select * from user where userid=?");

            pst.setString(1,id);

            ResultSet rs=
            pst.executeQuery();

            out.println("<html>");
            out.println("<body bgcolor='lightgreen'>");
            out.println("<center>");

            out.println("<h2>FARMER DETAILS</h2>");

            if(rs.next())
            {
                out.println("<table border=1>");

                out.println("<tr>");
                out.println("<th>Farmer Id</th>");
                out.println("<td>"+rs.getString(1)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Name</th>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Phone</th>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Email</th>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>DOB</th>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Gender</th>");
                out.println("<td>"+rs.getString(6)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Photo</th>");
                out.println("<td>");
                out.println(
                "<img src='"+
                rs.getString(7)+
                "' width=150 height=150>");
                out.println("</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Joining Date</th>");
                out.println("<td>"+rs.getString(8)+"</td>");
                out.println("</tr>");

                out.println("</table>");
            }

            out.println("</center>");
            out.println("</body>");
            out.println("</html>");

            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}