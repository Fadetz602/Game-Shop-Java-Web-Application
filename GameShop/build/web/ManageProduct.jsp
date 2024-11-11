<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dal.DAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Manage Products</title>
        <!-- Bootstrap CSS -->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap-reboot.min.css"/>

        <style>
            body {
                background-image: url('img/bglist2.jpg');
                background-size: cover;
                background-attachment: fixed;
                background-repeat: no-repeat;
                color: white;
            }
            .product-table {
                background-color: #2a2a2a;
                color: white;
                border-radius: 10px;
                overflow: hidden;
            }
            .product-table th, .product-table td {
                padding: 15px;
                text-align: left;
            }
            .product-table img {
                width: 100px;
                height: 100px;
                object-fit: cover;
            }
            .btn-success {
                background-color: #28a745;
                border-color: #28a745;
            }
            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
            }
        </style>
    </head>
    <body>
        <jsp:include page="nav.jsp">
            <jsp:param name="title" value="MANAGE PRODUCT" />
        </jsp:include>

        <div class="container mt-4">
            <h2>Manage Products</h2>
            <a href="#addProductModal" class="btn btn-primary mb-4" data-toggle="modal">ADD Product</a>

            <%-- Retrieve product data from DAO --%>
            <% DAO dao = new DAO();
               List<Product> products = dao.getAllProducts();
               request.setAttribute("data", products);
            %>

            <table class="table table-dark table-striped product-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${data}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td><img src="${product.img}" alt="Product Image"></td>
                            <td>
                                <a href="#editProductModal" class="btn btn-success editButton" data-toggle="modal" 
                                   data-id="${product.id}" data-name="${product.name}" data-img="${product.img}">Update</a>
                                <a href="#deleteProductModal" class="btn btn-danger deleteButton" data-toggle="modal" 
                                   data-id="${product.id}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <jsp:include page="footer.jsp" />

        <!-- Add Product Modal HTML -->
        <div id="addProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Publisher</label>
                                <input name="publisher" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Release Date</label>
                                <input name="releaseDate" type="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Platform</label>
                                <input name="platform" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-control" required>
                                    <c:forEach items="${cdata}" var="category">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Edit Product Modal HTML -->
        <div id="editProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="update" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <input type="hidden" id="editProductId" name="id" class="form-control" required>
                            <div class="form-group">
                                <label>Name</label>
                                <input id="editProductName" name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input id="editProductImage" name="image" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Delete Product Modal HTML -->
        <div id="deleteProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="delete" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <input type="hidden" id="deleteProductId" name="id" class="form-control">
                            <p>Are you sure you want to delete this Product?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and other scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- SB Forms JS-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script>
            $(document).ready(function () {
                // Populate data in Edit Product modal
                $('.editButton').on('click', function () {
                    var id = $(this).data('id');
                    var name = $(this).data('name');
                    var img = $(this).data('img');

                    $('#editProductId').val(id);
                    $('#editProductName').val(name);
                    $('#editProductImage').val(img);
                });

                // Set product id to delete in Delete Product modal
                $('.deleteButton').on('click', function () {
                    var id = $(this).data('id');
                    $('#deleteProductId').val(id);
                });
            });
        </script>
    </body>
</html>
