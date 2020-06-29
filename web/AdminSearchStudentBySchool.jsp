<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        Enter School Name <select name="school">
        <%
            Connection con=mypkg.Data.connect();
            String sql="select school from students";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            while(rs.next()){
                %>
                <option><%=rs.getString(1) %></option>
                <%
            }
        %>
        </select>
    </body>
</html>
