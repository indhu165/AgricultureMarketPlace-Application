import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddProductServlet extends HttpServlet
{
    public void doPost(HttpServletRequest req,
                       HttpServletResponse res)
                       throws ServletException, IOException
    {
        PrintWriter out=res.getWriter();

        String s1=req.getParameter("t1");
        String s2=req.getParameter("t2");
        String s3=req.getParameter("t3");
        String s4=req.getParameter("t4");
        String s5=req.getParameter("t5");
        String s6=req.getParameter("t6");
        String s7=req.getParameter("t7");
        String s8=req.getParameter("t8");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?,?,?,?)");

            pst.setString(1,s1);
            pst.setString(2,s2);
            pst.setString(3,s3);
            pst.setString(4,s4);
            pst.setString(5,s5);
            pst.setString(6,s6);
            pst.setString(7,s7);
            pst.setString(8,s8);
            pst.setString(9,"Available");
            HttpSession session = req.getSession();
            String fid =session.getAttribute("id").toString();
            String fname =session.getAttribute("name").toString();

            pst.setString(10,fid);
            pst.setString(11,fname);
            int x=pst.executeUpdate();

            if(x>0)
            {
                out.println("<html><body bgcolor='pink'>");
                out.println("<center>");
                out.println("<h2>Product Added Successfully</h2>");
                out.println("<br>");
                out.println("<a href='addproduct.jsp'>Click Here</a> to Back");
                out.println("</center>");
                out.println("</body></html>");
            }
            else
            {
                out.println("<html><body bgcolor='pink'>");
                out.println("<center>");
                out.println("<h2>Product Not Added</h2>");
                out.println("<br>");
                out.println("<a href='addproduct.jsp'>Click Here</a> to Back");
                out.println("</center>");
                out.println("</body></html>");
            }

            pst.close();
            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}