<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
<%
    HttpSession s=request.getSession();
    String temail=(String)session.getAttribute("email");
    Connection con=mypkg.Data.connect();
    String sql="select semail,ts from studentrequest where temail=?";
    String sql1="select name,school from students where email=?";
    PreparedStatement ps=con.prepareStatement(sql);
    PreparedStatement ps1=con.prepareStatement(sql1);
    ps.setString(1,temail);
    ResultSet rs=ps.executeQuery();
    if(!rs.next())
    {
        %>
        <body>

        <h1>No Request Found</h1>
        
    <% } 
    else{    
        rs.beforeFirst();
        rs.next();
        String ts=rs.getString(2);
        rs.beforeFirst();
        int c=0;
        while(rs.next() && !ts.equals("-1")){
            c++;
            String semail=rs.getString(1);
            ps1.setString(1, semail);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
            %>
            Name:   <a href="LoadStudent.jsp?email=<%=semail %>&&status=<%=rs.getString(2) %>"><%=rs1.getString(1) %></a><br>
            School: <%= rs1.getString(2) %>
    <%
        }
        if(c==0){
            %>
            <h1>No Request Found</h1>
            <%
        }
    }
%>
       
    </body>
</html>
