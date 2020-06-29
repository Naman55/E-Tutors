<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
    <body>
        <script>
            function f(email){
                if(confirm("Are you sure to remove the tutor?")){
                    window.location.replace("RemoveTutor?email="+email);
                }
            }
        </script>
        <pre>
        <%
            String clas=request.getParameter("class");
            String subject=request.getParameter("subject");
            String sql="select email from tutorsubjects where class=? and subject=?";
            Connection con=mypkg.Data.connect();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,clas);
            ps.setString(2,subject);
            ResultSet rs=ps.executeQuery();
            if(!rs.next()){
                %>
                No Tutor Found
                <%
            }
            else{
                rs.beforeFirst();
                while(rs.next()){
                    String email=rs.getString(1);
                    String sql1="select uname from tutors where email=?";
                    PreparedStatement ps1=con.prepareStatement(sql1);
                    ps1.setString(1, email);
                    ResultSet rs1=ps1.executeQuery();
                    rs1.next();
                    %>
                    <img src="LoadTutorPhoto?email=<%=email %>" height="100px" width="100px"/>
                    Name: <a href="AdminLoadTutor.jsp?email=<%=email %>"><%=rs1.getString(1) %></a>     <button onclick="f('<%=email %>')">Remove Tutor</button>
                    <%
                }
            }
        %>
        </pre>
    </body>
</html>