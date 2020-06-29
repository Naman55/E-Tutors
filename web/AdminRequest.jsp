<html>
    <body bgcolor="black">
        <h3>Requests</h3><br/>
        <a href="AdminTutor.jsp">Admin Panel</a>
        <hr>
        <pre>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String mail;
    Connection con=mypkg.Data.connect();
    String sql="select email from tutorregrequest";
    String s1="select uname,email,address,age,gender,contact,hq from tutors where email=?";
    Statement st = con.createStatement();
    PreparedStatement ps=con.prepareStatement(s1);
    ResultSet rs = st.executeQuery(sql);
    
    while(rs.next())
    {
        
        mail=rs.getString(1);
        ps.setString(1,mail);
        ResultSet rs1=ps.executeQuery();
        rs1.next();
        %>
        <img src="LoadTutorPhoto?email=<%=mail%>" height="150" width="150"><br>
 
 <table style="text-align: left;color: white; font-size: 30px">
    <!--  Name -->
    <tr>    
        <th>Name</th>   <td><%=rs1.getString(1)%></td>
        <td rowspan="7" style="padding: 50px"><img src="LoadTutorID?email=<%=mail%>" height="340" width="235"/></td>
        <td rowspan="7"><img src="LoadTutorMS?email=<%=mail%>" height="340" width="235"/></td>
    </tr>
    <!--  Email -->
    <tr>    
        <th>Email</th>          <td><%=rs1.getString(2)%></td>
    </tr>
    <!--  Address -->
    <tr>
        <th>Address</th>        <td><%=rs1.getString(3)%></td></tr>
    <tr>
        <th>Age</th>            <td><%=rs1.getString(4)%></td>
    </tr>
    <!--  Gender-->
    <tr>
        <th>Gender</th>         <td><%=rs1.getString(5)%></td>
    </tr>
    <!--  Contact-->
    <tr>
        <th>Contact</th>        <td><%=rs1.getString(6)%></td>
    </tr>
    <!--  Highest Qualification-->
    <tr>
        <th>Highest Qualification</th>      <td><%=rs1.getString(7)%></td>
    </tr>
    <!-- Buttons -->
    <tr>
        <th style="text-align: center"><a href="AdminRegisterTutor?email=<%=rs1.getString(2)%>"><button>Accept</button></a></th>
        <td><a href="AdminRejectTutor?email=<%=rs1.getString(2)%>"><button>Reject</button></a><br/></td>
        <td style="text-align: center;">ID Proof</td>
        <td style="text-align: center;">Marksheet/ Degree</td>
    </tr>
    
 </table>
<hr>
        <%    


    }

            
%>
        </pre>
        <hr>
    </body>
</html>
