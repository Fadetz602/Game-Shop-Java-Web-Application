<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Home Page Fadetz Gaming</title>
    <!-- Favicon-->
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
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        body {
            background-color: gray;
        }
        .masthead {
            position: relative;
            width: 100%;
            height: 100vh;
            min-height: 25rem;
            background: linear-gradient(to bottom, rgba(0,0,0,0.8) 0%, rgba(0,0,0,0.8) 100%), url('path/to/your/image.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: scroll;
            background-size: cover;
        }
        .masthead .container {
            position: relative;
            z-index: 2;
        }
        .masthead:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: gray;
            z-index: 1;
            opacity: 0.5; /* Adjust as needed */
        }
    </style>
</head>
<body id="page-top">
    <%-- DAO dao = new DAO(); List <Product> data = dao.getAllProducts(); List <Category> cdata = dao.getAllCategories(); --%>
    <!-- Navigation-->
    <jsp:include page="nav.jsp"/>
    <!-- Masthead-->
    <header class="masthead">
        <div class="container px-4 px-lg-5 h-100">
            <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                <div class="col-lg-8 align-self-end">
                    <h1 class="text-white font-weight-bold">Your Favorite Place for Low Cost Hot Games</h1>
                    <hr class="divider" />
                </div>
                <div class="col-lg-8 align-self-baseline">
                    <p class="text-white-75 mb-5">Here we provide the hottest modern games. Rich genres, diverse gameplay, experience it now !</p>
                    <a class="btn btn-primary btn-xl" href="show">Find Out More</a>
                </div>
            </div>
        </div>
    </header>
    <!-- Footer-->
    <footer class="bg-light py-5" id="contact">
        <div class="container px-4 px-lg-5">
            <div class="small text-center text-muted">
                <h3> Contact INFO </h3><br>
                Place: Ba Dinh, Ha Noi, Viet Nam<br>
                Contact email: chuphucanh602@gmail.com<br>
                Phone number: (+84)123456789<br>
                Please tell us your requirements
                We will reply soon!
            </div>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- SimpleLightbox plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- SB Forms JS-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
