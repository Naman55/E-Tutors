<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    String semail=request.getParameter("semail");
    String temail=request.getParameter("temail");
    //HttpSession s=request.getSession();
    session.setAttribute("semail", semail);
    session.setAttribute("temail", temail);
    session.setMaxInactiveInterval(1000000);
    Connection con=mypkg.Data.connect();
    String sql="select ts from studentrequest where semail=? and temail=?";
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setString(1, semail);
    ps.setString(2, temail);
    ResultSet rs=ps.executeQuery();
    rs.next();
    String ts=rs.getString(1);
    if(ts.equals("0")){
        response.sendRedirect("LoadTutor.jsp?email="+temail);
    }
    else if(ts.equals("-1")){
        String sql1="delete from studentrequest where semail=? and temail=?";
        PreparedStatement ps1=con.prepareStatement(sql1);
        ps1.setString(1,semail);
        ps1.setString(2,temail);
        ps1.executeUpdate();
        response.sendRedirect("StudentTutorRequest.jsp");
    }
    else if(ts.equals("1")){
        String sql2="select uname,age,gender,contact,hq from tutors where email=?";
        PreparedStatement ps2=con.prepareStatement(sql2);
        ps2.setString(1, temail);
        ResultSet rs1=ps2.executeQuery();
        rs1.next();
    
%>
<html>
    <body>
        <img src="LoadTutorPhoto?email=<%=temail %>" height="100" width="100"/><br>
        Name : <%=rs1.getString(1) %><br>
        Age :  <%=rs1.getString(2) %><br>
        Gender: <%=rs1.getString(3) %><br>
        Contact: <%=rs1.getString(4) %><br>
        Highest Qualification : <%=rs1.getString(5) %><br><br>
        Confirm Timing:<br>
        Time: <select  name="time" id="tt">
<%
    String sql3="select time from tutortime where email=?";
    PreparedStatement ps3=con.prepareStatement(sql3);
    ps3.setString(1, temail);
    ResultSet rs3=ps3.executeQuery();
    while(rs3.next()){
        %>
        <option><%=rs3.getString(1) %></option>
        <%
    }
%>
        </select><br><br>
        Select Subject Details:<br>
        Enter Standard:<br>
        <select id="clas" name="class">
            <%
                String sql5="select class from tutorsubjects where email=?";
                PreparedStatement ps5=con.prepareStatement(sql5);
                ps5.setString(1, temail);
                ResultSet rs5=ps5.executeQuery();
                while(rs5.next()){
                    %>
                    <option><%=rs5.getString(1) %></option>
                    <%
                }
            %>
        </select><br><br>
        Enter subject:<br>
        <select id="sub" name="subject">
            <%
                String sql4="select subject from tutorsubjects where email=?";
                PreparedStatement ps4=con.prepareStatement(sql4);
                ps4.setString(1, temail);
                ResultSet rs4=ps4.executeQuery();
                while(rs4.next()){
                    %>
                    <option><%=rs4.getString(1) %></option>
                    <%
                }}
            %>
        </select><br><br>
        <script>
            function f(){
                var t=document.getElementById("tt").value;
                var s=document.getElementById("sub").value;
                var c=document.getElementById("clas").value;
                window.location.replace("StudentConfirmTutor?time="+t+"&&class="+c+"&&subject="+s);
            }
            function f1(){
                window.location.replace("StudentRejectTutor");
            }
            
        </script>
        
        
        Confirm Booking Tutor<br>
        <input type="button" value="Yes" onclick="f()"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="No" onclick="f1()">
        
    </body>
</html>
