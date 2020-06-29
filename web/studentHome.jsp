<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String semail=(String)session.getAttribute("email");  
    %>
    <body>
        <a href="StudentLogout">Logout</a><br>
        <a href="StudentViewSchedule.jsp">View Current Schedule</a><br>
        <a href="SearchTutor.jsp">Find Tutor</a><br>
        <a href="ViewStudentProfile.jsp?email=<%=semail %>">View Personal Details</a><br>
        <a href="StudentTutorRequest.jsp">Tutor Requests</a><br>
    </body>
</html>
