import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class MyOrdersServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException,IOException
    {
        res.setContentType("text/html");

        PrintWriter out=
        res.getWriter();

        try
        {
            HttpSession session=
            req.getSession();

            String userid=
            session.getAttribute("id").toString();

            Class.forName(
            "com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "select * from orders where userid=?");

            pst.setString(1,userid);

            ResultSet rs=
            pst.executeQuery();

            out.println("<html>");
            out.println("<body bgcolor='lightblue'>");

            out.println("<center>");
            out.println("<h2>MY ORDERS</h2>");

            out.println("<table border=1 width=90%>");

            out.println("<tr>");
            out.println("<th>Order ID</th>");
            out.println("<th>Product</th>");
            out.println("<th>Price</th>");
            out.println("<th>Qty</th>");
            out.println("<th>Amount</th>");
            out.println("<th>Date</th>");
            out.println("<th>Status</th>");
            out.println("<th>Farmer ID</th>");
            out.println("<th>Farmer Name</th>");
            out.println("<th>Farmer Details</th>");
            out.println("</tr>");

            while(rs.next())
            {
                out.println("<tr>");

                out.println("<td>"+rs.getString(1)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("<td>"+rs.getString(6)+"</td>");
                out.println("<td>"+rs.getString(7)+"</td>");
                out.println("<td>"+rs.getString(8)+"</td>");
                out.println("<td>"+rs.getString(9)+"</td>");
                out.println("<td>"+rs.getString(10)+"</td>");
                out.println("<td>"+rs.getString(11)+"</td>");

                out.println("<td><a href='ViewFarmerDetailsServlet?id="+rs.getString(10)+"'>View Details</a></td>");
                out.println("</tr>");
            }

            out.println("</table>");

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