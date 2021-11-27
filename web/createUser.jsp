<%-- 
    Document   : createUser
    Created on : Jun 8, 2021, 3:14:07 PM
    Author     : MSI
--%>

<%@page import="Nam.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
    </head>
    <body style="background-color:#E7F2F8">
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError("", "", "", "", "", "", "");
            }
        %>
        <form action="MainController" method="POST" >
            <div class="span3 well" style="text-align: center; position: absolute;left:37%;top:5%">
                <legend>Sign Up</legend>
                <form accept-charset="UTF-8" action="" method="post">
                    <input class="span3" name="UserID" placeholder="UserID" type="text" required=""/> 
                    <%=userError.getUserIDError()%></br>
                    <input class="span3" name="Name" placeholder="UserName" type="text" required=""/>
                    <%=userError.getNameError()%></br>
                    <input class="span3" name="RoleID" placeholder="RoleID" type="text" required=""/>
                    <%=userError.getRoleIDError()%></br>
                    <input class="span3" name="Address" placeholder="Address" type="text" required=""/>
                    <%=userError.getAddress()%></br>
                    <input class="span3" name="Password" placeholder="Password" type="password" required=""/> 
                    <%=userError.getPasswordError()%></br>
                    <input class="span3" name="confirm" placeholder="Confirm Password" type="password" required=""/> 
                    <%=userError.getConfirmPasswordError()%></br>
                    <input class="span3" name="Status" placeholder="Status" type="text" required=""/>
                    <%=userError.getStatus()%></br>
                    <button class="btn btn-warning" type="submit" name="action" value="Create">Sign up for Buying</button>
                    <button class="btn btn-warning" type="Reset">Reset</button>
                </form>
            </div>
        </form>
    </body>
</html>
