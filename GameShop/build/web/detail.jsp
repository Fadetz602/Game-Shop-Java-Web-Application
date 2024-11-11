<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dal.DAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%
    int productId = Integer.parseInt(request.getParameter("id"));
    DAO dao = new DAO();
    Product product = dao.getProductById(productId);
    request.setAttribute("product", product);
    List cdata = dao.getAllCategories();
      request.setAttribute("cdata",cdata);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Product Details</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="css/styles.css" rel="stylesheet" />
        <!-- Custom styles -->
        <style>
            body {
                background-image: url('img/bglist2.jpg');
                background-size: cover;
                background-attachment: fixed;
                background-repeat: no-repeat;
                color: white;
            }
            .product-block {
                margin-bottom: 20px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: black;
                color: white;
            }
            .product-img {
                width: 300px;
                height: auto;
                object-fit: cover;
                margin-bottom: 20px;
            }
            .product-details {
                text-align: left;
            }
            .btn-container {
                margin-top: 20px;
                display: flex;
                justify-content: flex-end;
                gap: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>

        <div class="container mt-5">
            <div class="product-block">
                <h2>Product Details</h2>
                <img src="${product.img}" class="product-img img-fluid rounded" alt="Product Image">
                <div class="product-details">
                    <h4>${product.name}</h4>
                    <p><strong>Publisher:</strong> ${product.publisher}</p>
                    <p><strong>Description:</strong> ${product.description}</p>
                    <p><strong>Price:</strong> $${product.price}</p>
                    <p><strong>Category:</strong> ${product.category}</p>
                </div>
                <div class="btn-container">
                    <button type="button" class="btn btn-primary">Add to Cart</button>
                    <button type="button" class="btn btn-success">Buy Now</button>
                </div>
            </div>
        </div>

        <div class="container mt-4" style="margin-top: 200px;">
            <h2 style="color: white;">Related Products:</h2>

            <c:forEach var="relatedProduct" items="${relatedProducts}">
                <div class="product-block">
                    <img src="${relatedProduct.img}" class="product-img img-fluid rounded" alt="Product Image">
                    <div class="product-details">
                        <h4><a href="detail?id=${relatedProduct.id}" style="color: white;">${relatedProduct.name}</a></h4>
                        <p><strong>Publisher:</strong> ${relatedProduct.publisher}</p>
                        <p><strong>Description:</strong> ${relatedProduct.description}</p>
                        <p><strong>Price:</strong> $${relatedProduct.price}</p>
                        <div class="product-info">
                            <p><strong>Category:</strong> ${relatedProduct.category}</p>
                            <div class="product-buttons">
                                <button type="button" class="btn btn-primary">Add to Cart</button>
                                <button type="button" class="btn btn-success">Buy Now</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <jsp:include page="footer.jsp" />
        <!-- Bootstrap JS and other scripts as per your original code -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
