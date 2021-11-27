<%-- 
    Document   : viewCart
    Created on : Jun 17, 2021, 1:14:01 PM
    Author     : MSI
--%>

<%@page import="Nam.user.userDTO"%>
<%@page import="Nam.shopping.Cart"%>
<%@page import="Nam.user.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <%
        userDTO user = (userDTO) session.getAttribute("LOGIN_USER");
        if (user != null &&"US".equals(user.getRoleID())) {
    %>
    <%
        Cart cart = (Cart) session.getAttribute("CART");
        if (cart == null) {
    %>
    <h1>You haven't choose any products!</h1>
    <a href="user.jsp">Add more</a>
    <%
    } else {
    %>
    <div class="container" style="background-color: #E7F2F8">
        <div class="row">
            <div class="col-sm-12 col-md-10 col-md-offset-1">
                <table class="table table-hover">
                    <%
                        int count = 0;
                        int total = 0;
                        for (BookDTO book : cart.getCart().values()) {
                            total += book.getQuantity() * book.getPrice();

                    %>
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>ProductID</th>
                            <th>Quantity</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Total</th>
                            <th>Modify</th>
                            <th>Remove </th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="MainController">
                        <tr>
                            <td class="col-sm-8 col-md-6">
                                <div class="media">
                                    <a class="thumbnail pull-left" href="#"> <img src="<%=book.getBookImage()%>"style="width:100px"> </a>
                                    <div class="media-body">
                                        <h4 class="media-heading"><a href="#"><%= book.getBookName()%></a></h4>
                                    </div>
                                </div>
                                </div></td>
                            <td class="col-sm-1 col-md-1 text-center">
                                <input type="text" name="id" value="<%=book.getBookID()%>" readonly=""/></td>
                            <td class="col-sm-1 col-md-1 text-center">
                                <input type="number" name="quantity" value="<%= book.getQuantity()%>"/></td>
                            <td class="col-sm-1 col-md-1 text-center"><%= book.getPrice()%>$</td>
                            <td class="col-md-1 text-center"><input type="hidden" name="total" value="<%= book.getQuantity() * book.getPrice()%>"/>
                                <%= book.getQuantity() * book.getPrice()%></td>
                            <td>
                                <input type="submit" name="action" value="Modify"/>
                                <input type="hidden" name="id" value="<%= book.getBookName()%>"/>
                            </td>
                            <td class="col-sm-1 col-md-1">
                                <input type="submit" class="btn btn-danger" name="action" value="Remove"/>
                                <input type="hidden" name="id" value="<%= book.getBookName()%>"/>
                            </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    <tr>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>$ <%= total%></strong></h3></td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn btn-default">
                                <span class="glyphicon glyphicon-shopping-cart"></span><a href="user.jsp"> Continue Shopping</a>
                            </button></td>
                        <td>
                            <form action="MainController">
                                <input type="hidden" name="total" value="<%=total%>"/> 
                                <button type="submit" class="btn btn-success" name="action" value="Accept">
                                    Checkout <span class="glyphicon glyphicon-play"></span>
                                </button></td>
                        </form>
                    </tr>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <%
        }

    %>
    <%} else {
    %>
    <p style="background-color: red">You must to login first</p>
    <a href="login.html">Login</a>
    <%
        }
    %>
</html>
