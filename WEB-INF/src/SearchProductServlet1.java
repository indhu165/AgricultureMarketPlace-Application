import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SearchProductServlet1 extends HttpServlet
{
    public void doGet(HttpServletRequest req,
                      HttpServletResponse res)
                      throws ServletException,IOException
    {
        res.setContentType("text/html");

        PrintWriter out=res.getWriter();

        try
        {
            String pname=req.getParameter("pname");
            String category=req.getParameter("category");

            Class.forName("com.mysql.jdbc.Driver");

            Connection con=
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test",
            "root",
            "Indu@1525");

            String sql=
            "select * from product where status='Available'";

            if(pname!=null && pname.length()>0)
            {
                sql=sql+
                " and productname like '%"+pname+"%'";
            }

            if(category!=null &&
               category.length()>0)
            {
                sql=sql+
                " and category='"+category+"'";
            }

            PreparedStatement pst=
            con.prepareStatement(sql);

            ResultSet rs=
            pst.executeQuery();

            out.println("<html>");
            out.println("<body bgcolor='pink'>");

            out.println("<center>");
            out.println("<h2>SEARCH RESULTS</h2>");

            out.println("<table border='1' width='90%'>");

            out.println("<tr>");
            out.println("<th>Product Id</th>");
            out.println("<th>Product Name</th>");
            out.println("<th>Category</th>");
            out.println("<th>Quantity</th>");
            out.println("<th>Price</th>");
            out.println("<th>Image</th>");
            out.println("</tr>");

            while(rs.next()){
        out.println("<tr>");

    out.println("<td>"+rs.getString(1)+"</td>");
    out.println("<td>"+rs.getString(2)+"</td>");
    out.println("<td>"+rs.getString(3)+"</td>");
    out.println("<td>"+rs.getString(4)+"</td>");
    out.println("<td>"+rs.getString(5)+"</td>");

    String img=rs.getString(7);

    out.println("<td><img src='"+img+"' width=100 height=100></td>");

    out.println(
    "<td><a href='AddToCartServlet?pid="
    +rs.getString(1)+
    "'>Add To Cart</a></td>");

    out.println("</tr>");
}

            out.println("</table>");

            out.println("<br>");
            out.println(
            "<a href='searchproduct.jsp'>Back</a>");

            out.println("</center>");
            out.println("</body>");
            out.println("</html>");

            rs.close();
            pst.close();
            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}