import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SearchProductServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException,IOException
    {
        PrintWriter out=res.getWriter();

        try
        {
            String pid=req.getParameter("pid");

            Class.forName("com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "select * from product where productid=?");

            pst.setString(1,pid);

            ResultSet rs=pst.executeQuery();

            if(rs.next())
            {
                req.setAttribute("id",rs.getString(1));
                req.setAttribute("name",rs.getString(2));
                req.setAttribute("category",rs.getString(3));
                req.setAttribute("qty",rs.getString(4));
                req.setAttribute("price",rs.getString(5));
                req.setAttribute("desc",rs.getString(6));

                RequestDispatcher rd=
                req.getRequestDispatcher(
                "modifyproduct1.jsp");

                rd.forward(req,res);
            }
            else
            {
                out.println("Product Not Found");
            }

            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}