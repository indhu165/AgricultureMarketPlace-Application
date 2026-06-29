import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class FarmerRegisterServlet extends HttpServlet
{
    public void doPost(HttpServletRequest req,
                       HttpServletResponse res)
                       throws ServletException,IOException
    {
        PrintWriter out=res.getWriter();

        try
        {
            String id=req.getParameter("t1");
            String name=req.getParameter("t2");
            String ph=req.getParameter("t3");
            String email=req.getParameter("t4");
            String dob=req.getParameter("t5");
            String gender=req.getParameter("t6");
            String pwd=req.getParameter("t7");

            java.text.SimpleDateFormat sd=
            new java.text.SimpleDateFormat("dd-MM-yyyy");

            String dt=
            sd.format(new java.util.Date());

            Class.forName("com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "insert into user values(?,?,?,?,?,?,?,?,?,?)");

            pst.setString(1,id);
            pst.setString(2,name);
            pst.setString(3,ph);
            pst.setString(4,email);
            pst.setString(5,dob);
            pst.setString(6,gender);
            pst.setString(7,"");
            pst.setString(8,dt);
            pst.setString(9,pwd);
            pst.setString(10,"Active");

            pst.executeUpdate();

            out.println("<h2>Farmer Registered Successfully</h2>");
            out.println("<a href='index.jsp'>Login</a>");

            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}