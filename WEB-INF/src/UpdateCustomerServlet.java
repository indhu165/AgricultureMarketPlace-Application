import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateCustomerServlet extends HttpServlet
{
    public void doPost(HttpServletRequest req,
                       HttpServletResponse res)
                       throws ServletException, IOException
    {
        try
        {
            String id=req.getParameter("t1");
            String name=req.getParameter("t2");
            String phone=req.getParameter("t3");
            String email=req.getParameter("t4");
            String dob=req.getParameter("t5");
            String gender=req.getParameter("t6");
            String address=req.getParameter("t7");
            String password=req.getParameter("t8");

            Class.forName("com.mysql.jdbc.Driver");

            Connection con=DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "update customer set username=?,phone=?,email=?,dob=?,gender=?,address=?,password=? where userid=?");

            pst.setString(1,name);
            pst.setString(2,phone);
            pst.setString(3,email);
            pst.setString(4,dob);
            pst.setString(5,gender);
            pst.setString(6,address);
            pst.setString(7,password);
            pst.setString(8,id);

            pst.executeUpdate();

            res.sendRedirect("ViewCustomer.jsp");

            con.close();
        }
        catch(Exception e)
        {
            res.getWriter().println(e);
        }
    }
}