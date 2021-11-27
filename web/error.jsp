<%-- 
    Document   : error
    Created on : Jun 21, 2021, 10:55:54 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error Page</title>
</head>
<body>
         <p class="text-danger">Error: <%=session.getAttribute("ERROR_MESSAGE")%></p>
         <button type="submit" style="font-size:20px" ><a href="login.html">Login Again</a></button>
</body>
</html>
