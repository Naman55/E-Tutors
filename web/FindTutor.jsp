<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>

<%
    String subject=request.getParameter("subject");
    String clas=request.getParameter("class");
    Connection con=mypkg.Data.connect();
    String sql="select email from tutorsubjects where subject=? and class=?";
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setString(1, subject);
    ps.setString(2, clas);
    String sql1="select uname from tutors where email=?";
    String sql2="select sd from description where email=?";
    
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
    rs.beforeFirst();
    while(rs.next())
    {
        String email=rs.getString(1);
        PreparedStatement ps1=con.prepareStatement(sql1);
        ps1.setString(1,email);
        ResultSet rs1=ps1.executeQuery();
        PreparedStatement ps2=con.prepareStatement(sql2);
        ps2.setString(1,email);
        ResultSet rs2=ps2.executeQuery();
        String d;
        if(rs2.next())
        {
            d=rs2.getString(1);
        }
        else{
            d=null;
        }
        rs1.next();
        
%>

        <pre>
        <img src="LoadTutorPhoto?email=<%=email %>" height="100" width="100" /><br>
        Name          <a href="LoadTutor.jsp?email=<%=email %>"><%=rs1.getString(1) %></a><br>
        Description : <%=d %><br>
        <a href="StudentRequest?email=<%=email %>"><button>Send Request</button></a><br><br>
    <%  
        }
    }
else{
    %>
    <h1>No Tutor Found</h1>
<% 
    }
%>
        </pre>
    </body>
</html>
