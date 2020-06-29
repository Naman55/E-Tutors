<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <%
            String temail=(String)session.getAttribute("email");
            String sql="select * from tschedule where temail=?";
            Connection con=mypkg.Data.connect();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, temail);
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
                    Student Name: <%=rs.getString("sname") %><br>
                    Class : <%=rs.getString("class") %><br>
                    Subject: <%=rs.getString("subject") %><br>
                    Time : <%=rs.getString("time") %><br>
                    Address: <%=rs.getString("address") %><br><br>
                    <%
                }
            }
        %>
    </body>
</html>
