<%@ page import="java.sql.*" %>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);

if(session.getAttribute("name") == null){
    response.sendRedirect("index.jsp");
    return;
}
%>
<html>
<head>
<frameset rows="20%,80%">
<Frame name="f1" src="awelcome.jsp">
<frameset cols="25%,*">
<Frame name="f2" src="aoptions.jsp">
<Frame name="f3" src="atarget.jsp">
</frameset>
</head></html>