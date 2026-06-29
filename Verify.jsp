<html>
<body bgcolor="wheat" text="blue">
     <%@page import="java.sql.*"%>
<%
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
try{
     Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","Indu@1525");
String utype=request.getParameter("t1");
String uname=request.getParameter("t2");
String pwd=request.getParameter("t3");
 
if(uname.length()!=0){
          if(pwd.length()!=0){
               if(utype.equals("Admin")){
                               if(uname.equals("Admin")&& pwd.equals("Admin"))
                               {
                              response.sendRedirect("AdminPage.jsp");
                             session.setAttribute("name","Administrator");
                               }else{
                               out.println("Invalid User Name/Password");
                               }
              }else if(utype.equals("Farmer/Seller")){
                
          pst=con.prepareStatement("select * from user where userid=? and pwd=? and status='Active'");
          pst.setString(1,uname);
          pst.setString(2,pwd);
          rs=pst.executeQuery();

          if(rs.next()){

               response.sendRedirect("FarmPage.jsp");
               session.setAttribute("id",rs.getString(1));
               session.setAttribute("name",rs.getString(2));
          }else{
               out.println("Invalid uname/password");
          }
              }else if(utype.equals("Buyer/User")){
          pst=con.prepareStatement("select * from customer where userid=? and password=?");
          pst.setString(1,uname);
          pst.setString(2,pwd);
          rs=pst.executeQuery();

          if(rs.next()){

               response.sendRedirect("CustPage.jsp");
               session.setAttribute("id",rs.getString(1));
               session.setAttribute("name",rs.getString(2));
          }else{
               out.println("Invalid uname/password");
          }

             }
        }else{
         out.println("Password Not Specified");
        }

}
else{
out.println("Username IS not Specified");
}
rs.close();
pst.close();
con.close();
}
catch(Exception e)
{
    e.printStackTrace();
    out.println(e);
}

%>
<br>
<a href='index.jsp'>click here</a> to back
</body>
</html>