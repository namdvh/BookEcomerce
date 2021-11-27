<%-- 
    Document   : update
    Created on : Jul 2, 2021, 6:49:43 PM
    Author     : MSI
--%>

<%@page import="Nam.user.UserError"%>
<%@page import="Nam.user.userDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body style="background-color: #E7F2F8">
        <%
            userDTO loginUser = (userDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError("", "", "", "", "", "", "");

            }
        %>
        <form action="MainController" method="POST">
            <div class="span3 well" style="text-align: center; position: absolute;left:37%;top:5%">
                <legend>Update Users</legend>
                    <input class="span3" name="UserID" placeholder="UserID" type="text" value="<%=request.getParameter("UserID")%>" readonly=""/></br>
                    <input class="span3" name="Name" placeholder="UserName" type="text" value="<%=request.getParameter("Name")%>" required=""/>
                    <%=userError.getNameError()%></br>
                    <input class="span3" name="RoleID" placeholder="RoleID" type="text" value="<%=request.getParameter("RoleID")%>" required=""/>
                    <%=userError.getRoleIDError()%></br>
                    <input class="span3" name="Address" placeholder="Address" type="text" value="<%=request.getParameter("Address")%>" required=""/>
                    <%=userError.getAddress()%></br>  
                    <input class="span3" name="Status" placeholder="Status" type="text" value="<%=request.getParameter("Status")%>" required=""/>
                    <%=userError.getStatus()%></br>
                    <input type="hidden" name="SearchUser" value="<%=request.getParameter("SearchUser")%>"/>    
                    <button class="btn btn-warning" type="submit" name="action" value="Confirm Update">Confirm</button>
                    <button class="btn btn-warning" type="Reset">Reset</button>
            </div>
        </form>
    </body>
</html>
