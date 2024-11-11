<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fixed Main Nav with Secondary Nav</title>
        <!-- Include necessary meta tags and CSS files -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            #secondaryNav {
                background-color: transparent;
                position: relative;
                top: 50px; /* Adjust the top distance as needed */
                z-index: 1000;
            }

            #mainNav {
                background-color: white;
                transition: background-color 0.3s ease;
                margin-bottom: 50px; /* Adjust to create space for secondary nav */
            }

            #mainNav .navbar-nav .nav-item .nav-link,
            #mainNav .navbar-brand {
                color: black;
            }

            #mainNav .navbar-nav .nav-item .nav-link:hover,
            #mainNav .navbar-nav .nav-item .nav-link:active,
            #mainNav .navbar-brand:hover {
                color: #333;
            }

            #mainNav.navbar-shrink {
                background-color: #fff;
            }

            #mainNav.navbar-shrink .navbar-brand {
                color: #212529;
            }

            #mainNav.navbar-shrink .navbar-brand:hover {
                color: #f4623a;
            }

            #mainNav.navbar-shrink .navbar-nav .nav-item .nav-link {
                color: #212529;
            }

            #mainNav.navbar-shrink .navbar-nav .nav-item .nav-link:hover {
                color: #f4623a;
            }

            /* Adjustments for secondary navigation items */
            #secondaryNav .nav-item {
                margin-right: 10px; /* Adjust spacing between items */
            }

            #secondaryNav .navbar-nav {
                margin-top: 10px; /* Adjust top margin */
            }

            /* Style for the secondary nav links */
            #secondaryNav .nav-link {
                display: block; /* Ensure the link behaves like a block element */
                padding: 10px 20px; /* Adjust padding as needed */
                background-color: #fff; /* White background */
                border: 1px solid #ccc; /* Add a border for a button-like appearance */
                border-radius: 5px; /* Rounded corners */
                border: 2px;
                color: #555; /* Text color */
                text-align: center; /* Center align text */
                transition: background-color 0.3s ease; /* Smooth transition for background color */
            }

        </style>
    </head>
    <body>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page import="dal.DAO" %>
        <%@ page import="java.util.List" %>
        <%@ page import="model.Product" %>
        <%@ page import="model.Category" %>

        <%-- DAO dao = new DAO();
            List<Product> products = dao.getAllProducts();
            List<Category> categories = dao.getAllCategories();
            request.setAttribute("data", products);
            request.setAttribute("cdata", categories); --%>

        <!-- Combined Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home">Home Page</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="#about">Library</a></li>
                        <li class="nav-item"><a class="nav-link" href="show">Store</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Categories
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <c:forEach var="ct" items="${cdata}">
                                    <a class="dropdown-item" href="category?cid=${ct.cid}">${ct.cname}</a>
                                </c:forEach>
                            </div>
                        </li>
                        <li class="nav-item">
                            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                                <input name="txt" type="text" class="form-control mr-sm-2" placeholder="Search...">
                                <button type="submit" class="btn btn-secondary my-2 my-sm-0">Search</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-success btn-sm ml-3" href="show">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light">3</span>
                            </a>
                        </li>
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="btn btn-danger btn-sm ml-3" href="logout">
                                    <i class="fa fa-sign-out"></i> Logout
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item">
                                <a class="btn btn-primary btn-sm ml-3" href="login.jsp">
                                    <i class="fa fa-sign-in"></i> Login
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Secondary Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light" id="secondaryNav">
            <div class="container px-4 px-lg-5">
                <div class="collapse navbar-collapse" id="navbarSecondaryResponsive">
                    <c:if test="${sessionScope.acc.role == 0}">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Manage Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="manage">Manage Product</a>
                        </li>
                    </ul>
                    </c:if>
                </div>
            </div>
        </nav>

        <!-- Include necessary JavaScript files -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            // JavaScript to control the navbar shrink on scroll
            $(window).scroll(function () {
                if ($("#mainNav").offset().top > 100) {
                    $("#mainNav").addClass("navbar-shrink");
                } else {
                    $("#mainNav").removeClass("navbar-shrink");
                }
            });
        </script>
    </body>
</html>
