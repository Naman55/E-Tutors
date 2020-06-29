<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>

<%
    String email=request.getParameter("email");
    String ts=request.getParameter("status");
    Connection con=mypkg.Data.connect();
    String sql="select name,gname,school,class,board,address,contact,gender from students where email=?";
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setString(1, email);
    ResultSet rs=ps.executeQuery();
    while(rs.next()){
%>
<pre>
        Name:               <%=rs.getString(1) %><br><br>
        Guardian's Name:    <%=rs.getString(2) %><br><br>
        School:             <%=rs.getString(3) %><br><br>
        Class:              <%=rs.getString(4) %><br><br>
        Board:              <%=rs.getString(5) %><br><br>
        Address:            <%=rs.getString(6) %><br><br>
        Contact:            <%=rs.getString(7) %><br><br>
        Gender:             <%=rs.getString(8) %><br><br>
<%
    if(ts.equals("1")){
        %>
        <h1>Waiting for the student to confirm</h1>
<%
    }
    else{

%>
        <a href="TutorAcceptStudent?email=<%=email %>"><button>Accept</button></a>      <a href="TutorRejectStudent?email=<%=email %>"><button>Reject</button></a>
        <%
         }   }
%>
</pre>
    </body>
</html>
