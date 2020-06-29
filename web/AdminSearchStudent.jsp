<html>
    <script>
        function f(select){
            request=new XMLHttpRequest();
            request.onreadystatechange=two;
            if(select.options[select.selectedIndex].getAttribute("myid")==="1")
                request.open("get","AdminSearchStudentByName.jsp",true);
            else if(select.options[select.selectedIndex].getAttribute("myid")==="0")
                request.open("get","AdminSearchStudentBySchool.jsp",true);
            else if(select.options[select.selectedIndex].getAttribute("myid")==="2")
                request.open("get","AdminSearchStudentByBoard.jsp",true);
            request.send(null);
            
        }
        function two(){
            if(request.status===200 && request.readyState===4)
                document.getElementById("1").innerHTML=request.responseText;
        }
    </script>
    <body>
        <form action="AdminSearchStudentBySomething.jsp">
            Search by:<select name="s" onchange="f(this)" >
                <option myid="1">Name</option>
                <option myid="0">School</option>
                <option myid="2">Board</option>
            </select> 
            <div id="1">
                Enter Name:<input type="text" name="name"/>
            </div>
            <input type="submit" value="search"/>
        </form>
    </body>
</html>