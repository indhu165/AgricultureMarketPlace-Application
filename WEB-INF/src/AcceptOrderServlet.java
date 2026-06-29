import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AcceptOrderServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException,IOException
    {
        PrintWriter out=
        res.getWriter();

        try
        {
            String oid=
            req.getParameter("id");

            HttpSession session=
            req.getSession();

            String fid=
            session.getAttribute("id").toString();

            String fname=
            session.getAttribute("name").toString();

            Class.forName(
            "com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "update orders set status=?,farmerid=?,farmername=? where orderid=?");

            pst.setString(1,"Accepted");
            pst.setString(2,fid);
            pst.setString(3,fname);
            pst.setString(4,oid);

            pst.executeUpdate();

            res.sendRedirect(
            "viewcustomerorders.jsp");
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}