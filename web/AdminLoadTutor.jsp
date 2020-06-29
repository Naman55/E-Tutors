<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <%
            String email=request.getParameter("email");
            RequestDispatcher rd=request.getRequestDispatcher("LoadTutor.jsp?email="+email);
            rd.include(request, response);
            RequestDispatcher rd1=request.getRequestDispatcher("ViewTuitionDetails.jsp?email="+email);
            rd1.include(request, response);
        %>
    </body>
</html>
