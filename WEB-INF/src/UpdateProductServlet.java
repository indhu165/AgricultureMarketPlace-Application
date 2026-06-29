import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateProductServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException,IOException
    {
        res.setContentType("text/html");

        PrintWriter out=res.getWriter();

        try
        {
            String id=req.getParameter("t1");
            String name=req.getParameter("t2");
            String category=req.getParameter("t3");
            String qty=req.getParameter("t4");
            String price=req.getParameter("t5");
            String desc=req.getParameter("t6");

            Class.forName("com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "update product set productname=?,category=?,quantity=?,price=?,description=? where productid=?");

            pst.setString(1,name);
            pst.setString(2,category);
            pst.setString(3,qty);
            pst.setString(4,price);
            pst.setString(5,desc);
            pst.setString(6,id);

            int x=pst.executeUpdate();

            out.println("<html>");
            out.println("<body bgcolor='pink'>");
            out.println("<center>");

            if(x>0)
            {
                out.println("<h2>Product Updated Successfully</h2>");
            }
            else
            {
                out.println("<h2>Update Failed</h2>");
            }

            out.println("<br>");
            out.println("<a href='modifyproduct.jsp'>Click Here</a> to Back");

            out.println("</center>");
            out.println("</body>");
            out.println("</html>");

            pst.close();
            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}