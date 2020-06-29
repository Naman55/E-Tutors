<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String temail=(String)session.getAttribute("email");
%>
<html>
    <body>
        <a href="TutorLogout">Logout</a><br>
        
        <a href="LoadTutor.jsp?email=<%=temail %>">View Profile</a><br>
        <a href="SetTuitionDetails.jsp">Set Subject Details</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ViewTuitionDetails.jsp?email=<%=temail%>">View Subject Details</a><br>
        <a href="SetTimings.jsp">Set Timings</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="View Timings.jsp">View Timings</a><br>
        <a href="SetPD.jsp">Personal Description</a><br>
        <a href="TutorStudentRequest.jsp">Student Requests</a><br>
        <a href="TutorViewSchedule.jsp">Current Schedule</a>
    </body>
</html>
