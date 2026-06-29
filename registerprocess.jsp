<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date" %>

<%
Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/test",
        "root",
        "Indu@1525"
    );

    String role = request.getParameter("role");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");

    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    String today = sdf.format(new Date());

    String newId = "";

    // ================= FARMER SELF REGISTRATION =================
    if ("Farmer".equals(role)) {

        pst = con.prepareStatement(
            "SELECT MAX(CAST(SUBSTRING(userid,2) AS UNSIGNED)) FROM user WHERE userid LIKE 'F%'"
        );

        rs = pst.executeQuery();

        int num = 0;

        if (rs.next() && rs.getString(1) != null) {
            num = Integer.parseInt(rs.getString(1));
        }

        num++;
        newId = "F" + String.format("%04d", num);

        pst = con.prepareStatement(
            "INSERT INTO user(userid,username,phno,email,dob,gender,img,jdate,pwd,status) VALUES(?,?,?,?,?,?,?,?,?,?)"
        );

        pst.setString(1, newId);
        pst.setString(2, username);
        pst.setString(3, phone);
        pst.setString(4, email);
        pst.setString(5, dob);
        pst.setString(6, gender);
        pst.setString(7, "");
        pst.setString(8, today);
        pst.setString(9, password);
        pst.setString(10, "Active");

        pst.executeUpdate();

        out.println("Farmer Registered Successfully with ID: " + newId);
    }

    // ================= CUSTOMER =================
    else if ("Customer".equals(role)) {

        pst = con.prepareStatement(
            "SELECT MAX(CAST(SUBSTRING(userid,2) AS UNSIGNED)) FROM customer WHERE userid LIKE 'C%'"
        );

        rs = pst.executeQuery();

        int num = 0;

        if (rs.next() && rs.getString(1) != null) {
            num = Integer.parseInt(rs.getString(1));
        }

        num++;
        newId = "C" + String.format("%04d", num);

        pst = con.prepareStatement(
            "INSERT INTO customer(userid,username,phone,email,dob,gender,address,joiningdate,password) VALUES(?,?,?,?,?,?,?,?,?)"
        );

        pst.setString(1, newId);
        pst.setString(2, username);
        pst.setString(3, phone);
        pst.setString(4, email);
        pst.setString(5, dob);
        pst.setString(6, gender);
        pst.setString(7, address);
        pst.setString(8, today);
        pst.setString(9, password);

        pst.executeUpdate();

        out.println("Customer Registered Successfully with ID: " + newId);
    }

    // ================= ADMIN ADD FARMER (1001 SYSTEM) =================
    else if ("AdminFarmer".equals(role)) {

        pst = con.prepareStatement(
            "SELECT MAX(CAST(userid AS UNSIGNED)) FROM user WHERE userid REGEXP '^[0-9]+$'"
        );

        rs = pst.executeQuery();

        int num = 1000;

        if (rs.next() && rs.getString(1) != null) {
            num = Integer.parseInt(rs.getString(1));
        }

        num++;
        newId = String.valueOf(num);

        pst = con.prepareStatement(
            "INSERT INTO user(userid,username,phno,email,dob,gender,img,jdate,pwd,status) VALUES(?,?,?,?,?,?,?,?,?,?)"
        );

        pst.setString(1, newId);
        pst.setString(2, username);
        pst.setString(3, phone);
        pst.setString(4, email);
        pst.setString(5, dob);
        pst.setString(6, gender);
        pst.setString(7, "");
        pst.setString(8, today);
        pst.setString(9, password);
        pst.setString(10, "Active");

        pst.executeUpdate();

        out.println("Admin Farmer Added Successfully with ID: " + newId);
    }

    else {
        out.println("Invalid Role Selected");
    }

    con.close();

} catch(Exception e) {
    out.println(e);
}
%>

<br><br>
<a href="index.jsp">Go Back</a>