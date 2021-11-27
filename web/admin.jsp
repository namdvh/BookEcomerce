<%-- 
    Document   : admin
    Created on : Jun 16, 2021, 11:34:38 AM
    Author     : MSI
--%>

<%@page import="Nam.user.BookDTO"%>
<%@page import="java.util.List" %>
<%@page import="Nam.user.userDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <title>Admin Page</title>
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
            <style>
                body {
                    color: #5BDCE1;
                    background: #F9D8CE;
                    font-family: 'Roboto', sans-serif;
                }
                .table-responsive {
                    margin: 30px 0;
                }
                .table-wrapper {
                    min-width: 1000px;
                    background: #fff;
                    padding: 20px;
                    box-shadow: 0 1px 1px rgba(0,0,0,.05);
                }
                .table-title {
                    padding-bottom: 10px;
                    margin: 0 0 10px;
                    min-width: 100%;
                }
                .table-title h2 {
                    margin: 8px 0 0;
                    font-size: 22px;
                }
                .search-box {
                    position: relative;        
                    float: right;
                }
                .search-box input {
                    height: 34px;
                    border-radius: 20px;
                    padding-left: 35px;
                    border-color: #ddd;
                    box-shadow: none;
                }
                .search-box input:focus {
                    border-color: #3FBAE4;
                }
                .search-box i {
                    color: #a0a5b1;
                    position: absolute;
                    font-size: 19px;
                    top: 8px;
                    left: 10px;
                }
                table.table tr th, table.table tr td {
                    border-color: #e9e9e9;
                }
                table.table-striped tbody tr:nth-of-type(odd) {
                    background-color: #fcfcfc;
                }
                table.table-striped.table-hover tbody tr:hover {
                    background: #f5f5f5;
                }
                table.table th i {
                    font-size: 13px;
                    margin: 0 5px;
                    cursor: pointer;
                }
                table.table td:last-child {
                    width: 130px;
                }
                table.table td a {
                    color: #a0a5b1;
                    display: inline-block;
                    margin: 0 5px;
                }
                table.table td a.view {
                    color: #03A9F4;
                }
                table.table td a.edit {
                    color: #FFC107;
                }
                table.table td a.delete {
                    color: #E34724;
                }
                table.table td i {
                    font-size: 19px;
                }    
                .pagination {
                    float: right;
                    margin: 0 0 5px;
                }
                .pagination li a {
                    border: none;
                    font-size: 95%;
                    width: 30px;
                    height: 30px;
                    color: #999;
                    margin: 0 2px;
                    line-height: 30px;
                    border-radius: 30px !important;
                    text-align: center;
                    padding: 0;
                }
                .pagination li a:hover {
                    color: #666;
                }	
                .pagination li.active a {
                    background: #03A9F4;
                }
                .pagination li.active a:hover {        
                    background: #0397d6;
                }
                .pagination li.disabled i {
                    color: #ccc;
                }
                .pagination li i {
                    font-size: 16px;
                    padding-top: 6px
                }
                .hint-text {
                    float: left;
                    margin-top: 6px;
                    font-size: 95%;
                }    
            </style>
            <script>
                $(document).ready(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
            </script>
        </head>
        <body>
            <%
                userDTO loginUser = (userDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.html");
                    return;
                }
            %>
            <%
                String error_message = (String) request.getAttribute("ERROR_MESSAGE");
                if (error_message != null) {
            %>
            <h1 style="background-color: red"><%=error_message%>
            </h1>
            <%
                }
            %>
            <div class="container-xl">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-8"><h2 style="font-size: 30px"> Hello Admin: <%=loginUser.getName()%>
                                    </h2>
                                    <h1>
                                        <form action="MainController" style="font-size: 20px">
                                            <input type="submit" name="action" value="Logout" style="color:#5BDCE1"/>
                                        </form>
                                    </h1>
                                </div>
                                <div class="col-sm-4">
                                    <div class="search-box">
                                        <i class="material-icons">&#xE8B6;</i>
                                        <%
                                            String searchUser = (String) request.getParameter("SearchUser");
                                            if (searchUser == null) {
                                                searchUser = "";
                                            }
                                        %>
                                        <form action="MainController">
                                            <input type="text" class="form-control" placeholder="SearchUser" name="SearchUser"/>
                                            <input type="submit" name="action" class="form-control" value="SearchUser"<%=searchUser%>/>
                                            <!--<input type="submit" class="form-control" placeholder="Search&hellip;">-->
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            List<userDTO> listU = (List<userDTO>) request.getAttribute("LIST_USER");
                            if (listU != null) {
                                if (!listU.isEmpty()) {
                        %>
                        <table class="table table-striped table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>UserID</th>
                                    <th>FullName</th>
                                    <th>RoleID</th>
                                    <th>Address</th>
                                    <th>Password</th>
                                    <th>Satus</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 1;
                                    for (userDTO user : listU) {
                                %>
                            <form action="MainController" style="text-align: center">
                                <tr>
                                    <td><%=count++%></td>
                                    <td><%= user.getUserID()%></td>
                                    <td><%= user.getName()%></td>
                                    <td><%= user.getRoleID()%></td>
                                    <td><%=user.getAddress()%></td>
                                    <td><%= user.getPassword()%></td>
                                    <td><%=user.getStatus()%></td>
                                    <td>      
                                        <a href="MainController?action=Update&UserID=<%=user.getUserID()%>&Name=<%=user.getName()%>&RoleID=<%=user.getRoleID()%>&Address=<%=user.getAddress()%>&Status=<%=user.getStatus()%>&SearchUser=<%= searchUser%>" class="edit" title="Update" data-toggle="tooltip"><i class="material-icons" type="submit" name="action" value="Update"/>&#xE254;</i></a>
                                        <a href="MainController?UserID=<%=user.getUserID()%>&action=Delete&SearchUser=<%= searchUser%>" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </form>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>  
            </div>   

            <%
                }
            %>

            <%
                }
            %>
        </body>
    </html>

