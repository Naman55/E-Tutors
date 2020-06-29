<html>
    <body>
        <%
            String s1=request.getParameter("email");
            String s2=request.getParameter("pwd");
            if(s1.equals("admin@gmail.com") && s2.equals("123"))
            {
                response.sendRedirect("AdminHome.jsp");
            }
            else{
                %>
                <script> 
                    alert("Incorrect Credentials");
                </script>
                <%
                response.sendRedirect("adminLogin.jsp");
            }
        %>
    </body>
</html>
