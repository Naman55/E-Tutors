<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>    
<pre>
        Subject Details:-
<% 
    String email=request.getParameter("email");
    Connection con=mypkg.Data.connect();
    String sql="select * from tutorsubjects where email=?";
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setString(1, email);
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
%>
        Class   <%= rs.getString(2)%>
        Subject <%= rs.getString(3)%>

<% 
    }
%>
</pre>