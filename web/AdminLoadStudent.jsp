<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <script>
            function f(email){
                if(confirm("Are you sure you want to remove the student?")){
                    window.location.replace("RemoveStudent?email="+email);
                }
            }
        </script>
        <pre>
        <%
            String email=request.getParameter("email");
            Connection con=mypkg.Data.connect();
            String sql="select * from students";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            while(rs.next()){
                %>
                Name:               <%=rs.getString(1) %>       
                Email:              <%=rs.getString(9) %>
                Guardian's Name:    <%=rs.getString(2) %>
                School:             <%=rs.getString(3) %>
                Class:              <%=rs.getString(4) %>
                Contact:            <%=rs.getString(5) %>
                Address;            <%=rs.getString(6) %>
                D.O.B.:             <%=rs.getString(7) %>
                Gender:             <%=rs.getString(8) %>
                Board:              <%=rs.getString(10) %>                  <button onclick="f('<%=rs.getString(9) %>')">Remove Student</button>   
                <%
            }
        %>
        </pre>
    </body>
</html>
