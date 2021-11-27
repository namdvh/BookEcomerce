<%-- 
    Document   : user
    Created on : Jun 20, 2021, 11:50:11 AM
    Author     : MSI
--%>

<%@page import="Nam.Dao.BookDAO"%>
<%@page import="Nam.user.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="Nam.user.userDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>

    <html lang="en">
        <head>
            <title>Book Store</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        </head>
        <body>

            <nav class="navbar navbar-inverse" style="color: #F79489;margin-bottom:0%">
                <div class="container-fluid">
                    <div class="navbar-header" >
                        <a class="navbar-brand" href="user.jsp" style=" color: #F9CCD3;font-family: Garamond, serif;font-size:30px;text-align: center">Book Store</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="user.jsp"  style=" color: #F79489">Home</a></li>
                        <li><a href="viewCart.jsp" style="font-size:15px; color:#F79489"> Cart <i class="fa fa-shopping-cart"></i></a></li>
                        <li><a href="admin.jsp" style=" color: #F79489">Admin Page</a></li>
                    </ul>
                    </li>
                    </ul>
                    <%
                        userDTO user = (userDTO) session.getAttribute("LOGIN_USER");
                        if (user == null) {
                    %>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="createUser.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                    <%
                    } else {
                    %>
                    <ul class="nav navbar-nav navbar-right" style="position: absolute; right: 20px" >
                        <li><span></span><p style="color: #F79489; display: block">Hello User <%= user.getName()%></p></li>  

                </div>
                <form action="MainController" class="nav navbar-nav navbar-right" style="position: absolute; right: 50px; top:20px;color: #F79489"><span class="glyphicon glyphicon-log-in"></span>
                    <input type="submit" name="action" value="Logout"/>
                </form>
                <%
                    }
                %>
            </nav>

        </body>
    </html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product pages</title>
        <link rel="stylesheet" href="myUser.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    </head>
    <body style="background-color: #EED6D3 ">

        <p style="border-radius: 10px; padding: 20px">
            ${requestScope.SHOPPING_MESSAGE}
        </p>
        <p>
            ${requestScope.ERROR_SHOPPING_MESSAGE}
        </p>
        <p>${requestScope.CHECKOUT_MESSAGE}</p>

        <%
            List<BookDTO> bookList = (BookDAO.selectBook());
            if (bookList != null) {
                if (!bookList.isEmpty()) {
        %>
        <%
            int count = 1;
            for (BookDTO book : bookList) {
        %>
        
        <div class="card" style="margin:10px;margin-left: 60px">
            <form action="MainController">
                <img src="<%=book.getBookImage()%>" style="width:150px;height: 180px">
                <h1 style="color:#51A7AD"><%=book.getBookName()%></h1>
                <p class="price">Price : $<%= book.getPrice()%></p>
                <p style="color:#AE388B;font:bold">Available Quantity: <%=book.getQuantity()%></p>
                <p>
                    <input type="hidden" name="BookID" value="<%=book.getBookID()%>"/>
                    <input type="hidden" name="Name" value="<%=book.getBookName()%>"/>
                    <input type="hidden" name="Price" value="<%=book.getPrice()%>"/>
                    <input type="hidden" name="Image" value="<%=book.getBookImage()%>"/>
                    <input type="number" name="Quantity" style="margin-bottom: 7px;border-radius: 10px"/>                     
                    <input type="hidden" name="CategoryID" value="<%=book.getCategoryID()%>"/>
                    <button type="submit" name="action" value="Add to Cart" style="font-size:24px" >Add to Cart<i class="fa fa-shopping-cart"></i></button>
                </p>              
            </form>
        </div>
        <%
            }
        %>
        <%
            }
        %>

        <%
            }
        %>

    </h1>
    <!--        <form action="MainController">
                <p><input type="submit" name="action" value="View Cart"></p>
            </form>-->
</body>
</html>
