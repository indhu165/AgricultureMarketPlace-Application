<%@ page import="java.sql.*" %>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);

if(session.getAttribute("id") == null){
    response.sendRedirect("index.jsp");
    return;
}
%>

<html>
<head>

<html>

<head>
<title>Customer Dashboard</title>

<frameset rows="20%,80%">

<frame src="cwelcome.jsp" name="f1">

<frameset cols="25%,75%">

<frame src="coptions.jsp" name="f2">

<frame src="ctarget.jsp" name="f3">

</frameset>

</frameset>

</head>

</html>