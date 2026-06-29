import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ComplaintServlet extends HttpServlet
{
    public void doPost(HttpServletRequest req,
                       HttpServletResponse res)
                       throws ServletException,IOException
    {
        PrintWriter out=res.getWriter();

        try
        {
            HttpSession session=
            req.getSession();

            String id=
            session.getAttribute("id").toString();

            String name=
            session.getAttribute("name").toString();

            String msg=
            req.getParameter("msg");

            String type="Customer";

            String page=
            req.getHeader("referer");

            if(page!=null &&
               page.contains("Farm"))
            {
                type="Farmer";
            }

            Class.forName(
            "com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            int cid=1;

            PreparedStatement p1=
            con.prepareStatement(
            "select max(cid) from complaint");

            ResultSet rs=
            p1.executeQuery();

            if(rs.next())
            {
                try
                {
                    cid=
                    Integer.parseInt(
                    rs.getString(1))+1;
                }
                catch(Exception e)
                {
                    cid=1;
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
            "insert into complaint values(?,?,?,?,?,?,?)");

            pst.setInt(1,cid);
            pst.setString(2,id);
            pst.setString(3,name);
            pst.setString(4,type);
            pst.setString(5,msg);
            pst.setString(6,dt);
            pst.setString(7,"Pending");

            pst.executeUpdate();

            out.println("<html>");
            out.println("<body bgcolor='pink'>");
            out.println("<center>");
            out.println("<h2>Complaint Submitted Successfully</h2>");
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