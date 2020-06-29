<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <%
            String semail=(String)session.getAttribute("email");
            String sql="select * from sschedule where semail=?";
            Connection con=mypkg.Data.connect();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, semail);
            ResultSet rs=ps.executeQuery();
            if(!rs.next()){
                %>
                No Schedule Found
                <%
            }
            else{
                rs.beforeFirst();
                while(rs.next()){
                    %>
                    Tutor Name: <%=rs.getString("tname") %><br>
                    Subject: <%=rs.getString("subject") %><br>
                    Time : <%=rs.getString("time") %><br><br>
                    <%
                }
            }
        %>
    </body>
</html>
