import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddToCartServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try
        {
            String pid = req.getParameter("pid");

            HttpSession session = req.getSession();

            String userid =
            session.getAttribute("id").toString();

            Class.forName("com.mysql.jdbc.Driver");

            Connection con =
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            int cartid = 1;

            PreparedStatement pst1 =
            con.prepareStatement(
            "select max(cartid) from cart");

            ResultSet rs1 =
            pst1.executeQuery();

            if(rs1.next())
            {
                try
                {
                    cartid =
                    Integer.parseInt(
                    rs1.getString(1)) + 1;
                }
                catch(Exception e)
                {
                    cartid = 1;
                }
            }

            PreparedStatement pst2 =
            con.prepareStatement(
            "select * from product where productid=?");

            pst2.setString(1,pid);

            ResultSet rs2 =
            pst2.executeQuery();

            if(rs2.next())
            {
                String pname =
                rs2.getString("productname");

                String price =
                rs2.getString("price");

                String farmerid =
                rs2.getString("userid");

                String farmername =
                rs2.getString("username");

                String qty = "1";

                String amount = price;

                PreparedStatement pst3 =
                con.prepareStatement(
                "insert into cart values(?,?,?,?,?,?,?,?,?)");

                pst3.setInt(1,cartid);
                pst3.setString(2,userid);
                pst3.setString(3,pid);
                pst3.setString(4,pname);
                pst3.setString(5,price);
                pst3.setString(6,qty);
                pst3.setString(7,amount);
                pst3.setString(8,farmerid);
                pst3.setString(9,farmername);

                pst3.executeUpdate();

                out.println("<html>");
                out.println("<body bgcolor='lightblue'>");
                out.println("<center>");
                out.println("<h2>Product Added Successfully</h2>");
                out.println("<br><br>");
                out.println("<a href='searchproduct.jsp'>");
                out.println("Continue Shopping");
                out.println("</a>");
                out.println("<br><br>");
                out.println("<a href='viewcart.jsp'>");
                out.println("View Cart");
                out.println("</a>");
                out.println("</center>");
                out.println("</body>");
                out.println("</html>");
            }

            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}