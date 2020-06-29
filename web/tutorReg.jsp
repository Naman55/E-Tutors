<!DOCTYPE HTML>
<html lang="en" >
<html>
<head>
  <title>Tutor Registration</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="login_style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>  
</head>

<body class="body">
    
<div class="login-page">
  <div class="form">
    <h1>Registration page</h1>
    <form action="TRegistration" method="post" enctype="multipart/form-data">
            <table>
        <tr>
                    <td>Name :</td>
                    <td><input type="text" name="uname"></td>
        </tr>

                <tr>
                    <td>email :</td>
                    <td><input type="email" name="email"></td>
                </tr>

                <tr>
                    <td>Password :</td>
                    <td><input type="password" name="pwd"></td>
                </tr>

                <tr>
                    <td>Address :</td>
                    <td><input type="text" name="address"></td>
                </tr>
                <tr>
                    <td>Age :</td>
                    <td><input type="number" name="age"></td>
                </tr>
                <tr>
                    <td>Gender :</td>
                    <td><select name="gender"><option>Male</option><option>Female</option></select></td>
                </tr>
                <tr>
                    <td>Contact No. :</td>
                    <td><input type="tel" name="contact"></td>
                </tr>
                <tr>
                    <td>Highest Qualification :</td>
                    <td><select name="hq"><option>9th</option>
                            <option>10th</option>
                            <option>11th</option>
                            <option>12th</option>
                            <option>B.Tech.</option>
                            <option>B.Sc.</option>
                            <option>B.Com.</option>
                        </select></td>
                </tr>
                <tr>
                    <td>ID Proof :</td>
                    <td><input type="file" name="id"/></td>
                </tr>
                <tr>
                    <td>Latest Marksheet/Degree :</td>
                    <td><input type="file" name="ms"/></td>
                </tr>
                <tr>
                    <td>Photo :</td>
                    <td><input type="file" name="photo"/></td>
                </tr>
            </table>
            <input type="submit" value="Save" style="color: white;background-color: #148f77" />
    </form>
  </div>
</div>
</body>
</html>