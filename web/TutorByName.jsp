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
            String name=request.getParameter("name");
            String sql="select email from tutors where uname=?";
            Connection con=mypkg.Data.connect();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,name);
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
                    %>
                    <img src="LoadTutorPhoto?email=<%=email %>" height="100px" width="100px"/>
                    Name: <a href="AdminLoadTutor.jsp?email=<%=email %>"><%=name %></a>     <button onclick="f('<%=email %>')">Remove Tutor</button>
                    <br><br><br>
                    <%
                }
            }
        %>
        </pre>
    </body>
</html>