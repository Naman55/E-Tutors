<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<% 
    HttpSession s=request.getSession();
    String email=(String)s.getAttribute("email");
    Connection con=mypkg.Data.connect();
    String sql="select * from tutortime where email=?";
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setString(1, email);
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
%>
        Timing <%= rs.getString(2)%>
<% 
    }
%>