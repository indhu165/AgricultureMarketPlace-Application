import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RateReviewServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException,IOException
    {
        res.setContentType("text/html");

        PrintWriter out=res.getWriter();

        try
        {
            HttpSession session=
            req.getSession();

            String userid=
            session.getAttribute("id").toString();

            String username=
            session.getAttribute("name").toString();

            String pid=
            req.getParameter("pid");

            String pname=
            req.getParameter("pname");

            String rating=
            req.getParameter("rating");

            String review=
            req.getParameter("review");

            Class.forName(
            "com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            int rid=1;

            PreparedStatement p1=
            con.prepareStatement(
            "select max(reviewid) from review");

            ResultSet r1=
            p1.executeQuery();

            if(r1.next())
            {
                try
                {
                    rid=
                    Integer.parseInt(
                    r1.getString(1))+1;
                }
                catch(Exception e)
                {
                    rid=1;
                }
            }

            java.text.SimpleDateFormat sd=
            new java.text.SimpleDateFormat(
            "dd-MM-yyyy");

            String dt=
            sd.format(
            new java.util.Date());

            PreparedStatement pst=
            con.prepareStatement(
            "insert into review values(?,?,?,?,?,?,?,?)");

            pst.setInt(1,rid);
            pst.setString(2,pid);
            pst.setString(3,pname);
            pst.setString(4,userid);
            pst.setString(5,username);
            pst.setString(6,rating);
            pst.setString(7,review);
            pst.setString(8,dt);

            int x=pst.executeUpdate();

            if(x>0)
            {
                out.println("<h2>Review Submitted Successfully</h2>");
            }
            else
            {
                out.println("<h2>Failed</h2>");
            }

            out.println("<br>");
            out.println("<a href='RateReview.jsp'>Back</a>");

            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}