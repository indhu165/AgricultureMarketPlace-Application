import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class PlaceOrderServlet extends HttpServlet
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

            Class.forName(
            "com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            PreparedStatement pst=
            con.prepareStatement(
            "select * from cart where userid=?");

            pst.setString(1,userid);

            ResultSet rs=
            pst.executeQuery();

            while(rs.next())
            {
                int oid=1;

                PreparedStatement p1=
                con.prepareStatement(
                "select max(orderid) from orders");

                ResultSet r1=
                p1.executeQuery();

                if(r1.next())
                {
                    try
                    {
                        oid=
                        Integer.parseInt(
                        r1.getString(1))+1;
                    }
                    catch(Exception e)
                    {
                        oid=1;
                    }
                }

                java.text.SimpleDateFormat sd=
                new java.text.SimpleDateFormat(
                "dd-MM-yyyy");

                String dt=
                sd.format(
                new java.util.Date());

                PreparedStatement p2=
                con.prepareStatement(
                "insert into orders values(?,?,?,?,?,?,?,?,?,?,?)");

                p2.setInt(1,oid);
                p2.setString(2,userid);
                p2.setString(3,rs.getString("productid"));
                p2.setString(4,rs.getString("productname"));
                p2.setString(5,rs.getString("price"));
                p2.setString(6,rs.getString("quantity"));
                p2.setString(7,rs.getString("amount"));
                p2.setString(8,dt);
                p2.setString(9,"Pending");
                p2.setString(10,rs.getString("farmerid"));
                p2.setString(11,rs.getString("farmername"));
                p2.executeUpdate();
            }

            PreparedStatement p3=
            con.prepareStatement(
            "delete from cart where userid=?");

            p3.setString(1,userid);

            p3.executeUpdate();

            out.println("<html>");
            out.println("<body bgcolor='lightblue'>");
            out.println("<center>");
            out.println("<h2>Order Placed Successfully</h2>");
            out.println("<br>");
            out.println("<a href='MyOrdersServlet'>View Orders</a>");
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