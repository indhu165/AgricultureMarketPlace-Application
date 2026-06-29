import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddCustomerServlet extends HttpServlet
{
    public void doPost(HttpServletRequest req,
                       HttpServletResponse res)
                       throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try
        {
            String id = req.getParameter("t1");
            String name = req.getParameter("t2");
            String phone = req.getParameter("t3");
            String email = req.getParameter("t4");
            String dob = req.getParameter("t5");
            String gender = req.getParameter("t6");
            String address = req.getParameter("t7");
            String joiningdate = req.getParameter("t8");
            String password = req.getParameter("t9");

            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/test",
                "root",
                "Indu@1525");

            PreparedStatement pst =
                con.prepareStatement(
                "insert into customer values(?,?,?,?,?,?,?,?,?)");

            pst.setString(1, id);
            pst.setString(2, name);
            pst.setString(3, phone);
            pst.setString(4, email);
            pst.setString(5, dob);
            pst.setString(6, gender);
            pst.setString(7, address);
            pst.setString(8, joiningdate);
            pst.setString(9, password);

            int x = pst.executeUpdate();

            if(x > 0)
            {
                out.println("<html>");
                out.println("<body bgcolor='pink'>");
                out.println("<center>");
                out.println("<h2>Customer Registered Successfully</h2>");
                out.println("<a href='AddCustomer.jsp'>Add Another Customer</a>");
                out.println("</center>");
                out.println("</body>");
                out.println("</html>");
            }
            else
            {
                out.println("<html>");
                out.println("<body bgcolor='pink'>");
                out.println("<center>");
                out.println("<h2>Registration Failed</h2>");
                out.println("</center>");
                out.println("</body>");
                out.println("</html>");
            }

            con.close();
        }
        catch(Exception e)
        {
            out.println("<html>");
            out.println("<body bgcolor='pink'>");
            out.println("<center>");
            out.println("<h2>Error :</h2>");
            out.println(e);
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}