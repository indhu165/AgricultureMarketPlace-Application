import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ViewCustomerDetailsServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException,IOException
    {
        res.setContentType("text/html");

        PrintWriter out = res.getWriter();

        try
        {
            String id = req.getParameter("id");

            Class.forName("com.mysql.jdbc.Driver");

            Connection con =
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst =
            con.prepareStatement(
            "select * from customer where userid=?");

            pst.setString(1,id);

            ResultSet rs = pst.executeQuery();

            out.println("<html>");
            out.println("<body bgcolor='lightblue'>");
            out.println("<center>");
            out.println("<h2>CUSTOMER DETAILS</h2>");

            if(rs.next())
            {
                out.println("<table border=1 cellpadding=10>");

                out.println("<tr>");
                out.println("<th>Customer ID</th>");
                out.println("<td>"+rs.getString(1)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Name</th>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Phone Number</th>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Email</th>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Date of Birth</th>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Gender</th>");
                out.println("<td>"+rs.getString(6)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Address</th>");
                out.println("<td>"+rs.getString(7)+"</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Joining Date</th>");
                out.println("<td>"+rs.getString(8)+"</td>");
                out.println("</tr>");

                out.println("</table>");
            }
            else
            {
                out.println("<h3>Customer Not Found</h3>");
            }

            out.println("<br>");
            out.println("<a href='javascript:history.back()'>Back</a>");

            out.println("</center>");
            out.println("</body>");
            out.println("</html>");

            rs.close();
            pst.close();
            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}