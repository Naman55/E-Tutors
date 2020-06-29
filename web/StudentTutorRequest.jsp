<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
<%
    HttpSession s=request.getSession();
    String semail=(String)s.getAttribute("email");
    Connection con=mypkg.Data.connect();
    String sql="select temail,ts from studentrequest where semail=?";
    String sql1="select uname from tutors where email=?";
    PreparedStatement ps=con.prepareStatement(sql);
    PreparedStatement ps1=con.prepareStatement(sql1);
    ps.setString(1, semail);
    ResultSet rs=ps.executeQuery();
    if(!rs.next())
    {
        %>
        <h1>No Requests Found</h1>
        <%
    }
    else{
        rs.beforeFirst(); 
        while(rs.next()){
            String temail=rs.getString(1);
            ps1.setString(1,temail);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
%>
            Name <a href="StudentTutorStatus.jsp?semail=<%=semail %>&&temail=<%=temail %>"><%=rs1.getString(1) %></a><br>
<%
            String ts=rs.getString(2);
            if(ts.equals("0")){
                %>
                <h2>Waiting for tutor to respond to the request...</h2><br><br>
                <%
            }
            else if(ts.equals("-1")){
                %>
                <h2>Request is rejected by Tutor</h2><br><br>
                <%
            }
            else if(ts.equals("1")){
                %>
                <h2>Request is accepted. Click on the name to confirm!</h2><br><br>
                <%
            }
 
        }
    }    
%>    
        
    </body>
</html>
