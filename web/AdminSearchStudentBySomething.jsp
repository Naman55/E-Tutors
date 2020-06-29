<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <body>
        <script>
            function f(email){
                if(confirm("Are you sure you want to remove the tutor")){
                    window.location.replace("RemoveStudent?email="+email);
                }
            }
        </script>
        <pre>
        <%
            String sb=request.getParameter("s");
            String name=null,school=null,board=null;
            Connection con=mypkg.Data.connect();
            PreparedStatement ps=null;
            if(sb.equals("Name")){
                name=request.getParameter("name");
                String sql="select name,gname,school,class,contact,address,dob,gender,board,email from students where name=?";
                ps=con.prepareStatement(sql);
                ps.setString(1, name);
            }
            else if(sb.equals("School"))
            {
                school=request.getParameter("school");
                String sql="select name,gname,school,class,contact,address,dob,gender,board,email from students where school=?";
                ps=con.prepareStatement(sql);
                ps.setString(1, school);
            }
            else if(sb.equals("Board"))
            {
                board=request.getParameter("board");
                String sql="select name,gname,school,class,contact,address,dob,gender,board,email from students where board=?";
                ps=con.prepareStatement(sql);
                ps.setString(1, board);
            }
            ResultSet rs=ps.executeQuery();
            if(!rs.next()){
                %>
                No Student Found
                <%
            }
            else{
                rs.beforeFirst();
                while(rs.next()){
                    String email=rs.getString(10);
                    %>
                    Name :              <%=rs.getString(1) %>
                    Guardian's Name :   <%=rs.getString(2) %>
                    School :            <%=rs.getString(3) %>
                    Class :             <%=rs.getString(4) %>
                    Contact :           <%=rs.getString(5) %>
                    Address:            <%=rs.getString(6) %>
                    D.O.B. :            <%=rs.getString(7) %>
                    Gender :            <%=rs.getString(8) %>
                    Board :             <%=rs.getString(9) %><br>
                    <button onclick="f('<%=email %>')">Remove</button>
                    <br><br><br>
                    <%
                }
                
            }
            
        %>
        </pre>
    </body>
</html>
