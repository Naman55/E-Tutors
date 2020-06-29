<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <body>
        <form action="FindTutor.jsp">
            Subject <select name="subject">
<% 
    Connection con=mypkg.Data.connect();
    String sql="select distinct subject from tutorsubjects";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery(sql);
    while(rs.next())
    {
%>
                <option><%=rs.getString(1) %></option>
    <% } %>
            </select><br>
            Class <input type="text" name="class"/><br>
            <input type="submit" value="Search"/>
        </form>
    </body>
</html>
