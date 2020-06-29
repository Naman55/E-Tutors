<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <pre>
        <script>
            function f(email){
                if(confirm("Are you sure to remove the tutor?")){
                    window.location.replace("RemoveTutor?email="+email);
                }
            }
        </script>
        <%
            Connection con=mypkg.Data.connect();
            String sql="select email,uname from tutors";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String email=rs.getString(1);
                String name=rs.getString(2);
                %>
                <img src="LoadTutorPhoto?email=<%=email %>" height="100px" width="100px"/>
                Name: <a href="AdminLoadTutor.jsp?email=<%=email %>"><%=name %></a>     <button onclick="f('<%=email %>')">Remove Tutor</button><br><br>
                <%
            }
        %>
        </pre>
    </body>
</html>
