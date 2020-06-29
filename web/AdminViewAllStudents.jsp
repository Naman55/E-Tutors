<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <pre>
        <script>
            function f(email)
            {
                if(confirm("Are you sure you want to remove the student?")){
                    window.location.replace("RemoveStudent?email="+email);
                }
            }
        </script>
        <%
            Connection con=mypkg.Data.connect();
            String sql="select email,name,school from students";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                String email=rs.getString(1);
                String name=rs.getString(2);
                String school=rs.getString(3);
                %>
                Name:   <a href="AdminLoadStudent.jsp?email=<%=email %>"><%=name %></a>          <button onclick="f('<%=email %>')">Remove Student</button>
                School: <%=school %> <br><br>
                <%
            }
        %>
        </pre>
    </body>
</html>
