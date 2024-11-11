<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dal.DAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Show Products</title>
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
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: flex;
            align-items: center;
            background-color: black;
        }
        .product-img {
            width: 250px;
            height: 250px;
            object-fit: cover;
            margin-right: 20px;
        }
        .product-details {
            flex-grow: 1;
        }
        .product-buttons {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
        }
        .product-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp" />
    <div class="container mt-4" style="margin-top: 200px;">
        <h2 style="color: white;">Games Catalog</h2>

        <c:forEach var="product" items="${data}">
            <div class="product-block">
                <img src="${product.img}" class="product-img img-fluid rounded" alt="Product Image">
                <div class="product-details">
                    <h4><a href="detail?id=${product.id}" style="color: white;">${product.name}</a></h4>
                    <p><strong>Publisher:</strong> ${product.publisher}</p>
                    <p><strong>Description:</strong> ${product.description}</p>
                    <p><strong>Price:</strong> $${product.price} $</p>
                    <div class="product-info">
                        <p><strong>Category:</strong> ${product.category}</p>
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
    <!-- Bootstrap JS and other scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
