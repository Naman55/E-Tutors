<html>
    <body>
        <%
            String email=request.getParameter("email");
        %>
        <form action="StudentEditDetails">
            Name <input type="text" name="name"/><br><br>
            Guardian's Name <input type="text" name="gname"/><br><br>
            School <input type="text" name="school"/><br><br>
            Standard <input type="text" name="class"/><br><br>
            Board <select name="board">
                <option>CBSE</option>
                <option>MP</option>
            </select><br><br>
            Contact <input type="text" name="contact"/><br><br>
            Address <input type="text" name="address"/><br><br>
            D.O.B. <input type="date" name="dob"/><br><br>
            <input type="text" value="<%=email %>" name="email" readonly><br><br>
            <input type="submit" value="Update"/>
        </form>
    </body>
</html>
