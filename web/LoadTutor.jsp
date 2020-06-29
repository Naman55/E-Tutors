<%-- 
    Document   : LoadTutor
    Created on : Mar 16, 2020, 8:22:22 PM
    Author     : Naman
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String email=request.getParameter("email");
    Connection con=mypkg.Data.connect();
    String sql="select uname,age,gender,contact,hq from tutors where email=?";
    String sql1="select ld from description where email=?";
    String sql2="select time from tutortime where email=?";
    PreparedStatement ps2=con.prepareStatement(sql2);
    ps2.setString(1, email);
    PreparedStatement ps1=con.prepareStatement(sql1);
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setString(1,email);
    ps1.setString(1,email);
    ResultSet rs=ps.executeQuery();
    ResultSet rs1=ps1.executeQuery();
    ResultSet rs2=ps2.executeQuery();
    rs.next();
    String d;
    if(rs1.next()){
        d=rs1.getString(1);
    }
    else{
        d=null;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <pre>
        <img src="LoadTutorPhoto?email=<%=email %>" height="100" width="100"/>
        Name                  <%=rs.getString(1) %>
        Age                   <%=rs.getString(2) %>
        Gender                <%=rs.getString(3) %>
        Contact               <%=rs.getString(4) %>
        Highest Qualification <%=rs.getString(5) %>
        Available Timings:-  
<%
    while(rs2.next()){
      %>
        <%=rs2.getString(1) %>
      <%
    }
%>
        About the Tutor       <%=d %><br>
        </pre>
    </body>
</html>
