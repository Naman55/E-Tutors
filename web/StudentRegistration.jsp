<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <form action="StudentRegistration">
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
            Gender <select name="gender">
                <option>Male</option>
                <option>Female</option>
            </select><br><br>
            Email <input type="text" name="email"/><br><br>
            Password <input type="password" name="pwd"/><br><br>
            <input type="submit" value="Register"/>
        </form>
    </body>
</html>
