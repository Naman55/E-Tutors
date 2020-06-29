<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <pre>
    <%
        String email=request.getParameter("email");
        Connection con=mypkg.Data.connect();
        String sql="select name,gname,school,class,board,address,contact,gender from students where email=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs=ps.executeQuery();
        rs.next();
    %>
    Name:               <%=rs.getString(1) %><br><br>
    Guardian's Name:    <%=rs.getString(2) %><br><br>
    School:             <%=rs.getString(3) %><br><br>
    Class:              <%=rs.getString(4) %><br><br>
    Board:              <%=rs.getString(5) %><br><br>
    Address:            <%=rs.getString(6) %><br><br>
    Contact:            <%=rs.getString(7) %><br><br>
    Gender:             <%=rs.getString(8) %><br><br>
    
    <a href="EditStudentDetails.jsp?email=<%=email %>"><button>Edit Details</button></a>
        </pre>
    </body>
</html>
