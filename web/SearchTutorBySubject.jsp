<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <form action="TutorBySubject.jsp">
            Enter Class <input type="text" name="class"/><br>
            Enter Subject <select name="subject">
            <%
            Connection con=mypkg.Data.connect();
            String sql="select subject from tutorsubjects";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
            %>
                <option><%=rs.getString(1) %></option>
            <%
            }
            %>
            </select>
            <input type="submit" value="search"/>
        </form>
    </body>
</html>
