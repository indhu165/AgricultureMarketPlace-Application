import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ModifyCustomerServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException, IOException
    {
        res.setContentType("text/html");

        PrintWriter out=res.getWriter();

        String id=req.getParameter("id");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection con=DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "select * from customer where userid=?");

            pst.setString(1,id);

            ResultSet rs=pst.executeQuery();

            out.println("<html><body>");
            out.println("<center>");

            if(rs.next())
            {
                out.println("<h2>Modify Customer</h2>");

                out.println("<form action='UpdateCustomerServlet' method='post'>");

                out.println("<table border='1'>");

                out.println("<tr>");
                out.println("<th>Customer Id</th>");
                out.println("<td><input type='text' name='t1' value='"+rs.getString(1)+"' readonly></td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Name</th>");
                out.println("<td><input type='text' name='t2' value='"+rs.getString(2)+"'></td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Phone</th>");
                out.println("<td><input type='text' name='t3' value='"+rs.getString(3)+"'></td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Email</th>");
                out.println("<td><input type='text' name='t4' value='"+rs.getString(4)+"'></td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>DOB</th>");
                out.println("<td><input type='date' name='t5' value='"+rs.getString(5)+"'></td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Gender</th>");
                out.println("<td><input type='text' name='t6' value='"+rs.getString(6)+"'></td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Address</th>");
                out.println("<td><input type='text' name='t7' value='"+rs.getString(7)+"'></td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<th>Password</th>");
                out.println("<td><input type='text' name='t8' value='"+rs.getString(8)+"'></td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<td colspan='2' align='center'>");
                out.println("<input type='submit' value='Update'>");
                out.println("</td>");
                out.println("</tr>");

                out.println("</table>");
                out.println("</form>");
            }
            else
            {
                out.println("<h3>Customer Not Found</h3>");
            }

            out.println("</center>");
            out.println("</body></html>");

            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}