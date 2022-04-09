<%-- 
    Document   : shop
    Created on : Jun 30, 2021, 4:58:51 PM
    Author     : Minh Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Boutique | Ecommerce bootstrap template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Lightbox-->
        <link rel="stylesheet" href="vendor/lightbox2/css/lightbox.min.css">
        <!-- Range slider-->
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">
        <!-- Bootstrap select-->
        <link rel="stylesheet" href="vendor/bootstrap-select/css/bootstrap-select.min.css">
        <!-- Owl Carousel-->
        <link rel="stylesheet" href="vendor/owl.carousel2/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="vendor/owl.carousel2/assets/owl.theme.default.css">
        <!-- Google fonts-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/favicon.png">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <div class="page-holder">
            <!-- navbar-->
            <header class="header bg-white">
                <div class="container px-0 px-lg-3">
                    <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="MainController"><span class="font-weight-bold text-uppercase text-dark">Boutique</span></a>
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">

                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link active" href="MainController">Shop</a>
                                </li>


                            </ul>
                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <ul class="navbar-nav ml-auto">           
                                    <li class="nav-item"><a class="nav-link" href="MainController?action=login"> <i class="fas fa-user-alt mr-1 text-gray"></i>Login</a></li>
                                </ul>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER != null}">

                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item"><a class="nav-link" href="#"> <i class="far fa-heart mr-1"></i><small class="text-gray">Hello ${sessionScope.LOGIN_USER.fullName}</small></a></li>
                                    <li class="nav-item"><a class="nav-link" href="cart.jsp"> <i class="fas fa-dolly-flatbed mr-1 text-gray"></i>Cart<small class="text-gray"></small></a></li>         
                                    <li class="nav-item"><a class="nav-link" href="MainController?action=logout"> <i class="fas fa-user-alt mr-1 text-gray"></i>Logout</a></li>
                                </ul>
                            </c:if>
                        </div>
                    </nav>
                </div>
            </header>
            <!--  Modal -->

            <div class="container">
                <!-- HERO SECTION-->
                <section class="py-5 bg-light">
                    <div class="container">
                        <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                            <div class="col-lg-6">
                                <h1 class="h2 text-uppercase mb-0">Shop</h1>
                            </div>
                            <div class="col-lg-6 text-lg-right">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                                        <li class="breadcrumb-item active" aria-current="page">Shop</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="py-5">
                    <div class="container p-0">
                        <div class="row">
                            <!-- SHOP SIDEBAR-->
                            <div class="col-lg-3 order-2 order-lg-1">
                                <h5 class="text-uppercase mb-4">Categories</h5>



                                <ul class="list-unstyled small text-muted pl-lg-4 font-weight-normal mb-5">
                                    <c:forEach items="${requestScope.LIST_CATEGORY}" var="category">
                                        <li class="mb-2"><a class="reset-anchor" href="MainController?action=searchCategory&&categoryID=${category.categoryID}">${category.categoryName}</a></li>
                                        </c:forEach>
                                </ul>

                            </div>
                            <!-- SHOP LISTING-->
                            <div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-6 mb-2 mb-lg-0">
                                        <form action="SearchController" method="POST">
                                           

                                            <input type="text" name="txtSearch" value=""/>
                                            <input type="submit" value="Search"/>

                                        </form>
                                    </div>
                                    <div class="col-lg-6">
                                        <ul class="list-inline d-flex align-items-center justify-content-lg-end mb-0">
                                            <li class="list-inline-item text-muted mr-3"><a class="reset-anchor p-0" href="MainController?action=acs">Price: Low to High</a></li>
                                            <li class="list-inline-item text-muted mr-3"><a class="reset-anchor p-0" href="MainController?action=desc">Price: High to Low</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- PRODUCT-->
                                    <c:forEach items="${requestScope.LIST_SHOES}" var="shoes">
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="product text-center">
                                                <div class="mb-3 position-relative">
                                                    <div class="badge text-white badge-"></div><a class="d-block" href="MainController?action=detail&&shoesID=${shoes.shoesID}"><img class="img-fluid w-100" src="img/${shoes.image}" alt="..."></a>
                                                    <div class="product-overlay">
                                                        <ul class="mb-0 list-inline">

                                                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="AddToCartController?shoesID=${shoes.shoesID}">Add to cart</a></li>

                                                        </ul>
                                                    </div>
                                                </div>
                                                <h6> <a class="reset-anchor" href="MainController?action=detail&&shoesID=${shoes.shoesID}">${shoes.shoesName}</a></h6>
                                                <p class="small text-muted">${shoes.price}$</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- PAGINATION-->

                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center justify-content-lg-end">
                                        <c:if test="${requestScope.CATEGORY ==null}"> 
                                            <c:forEach begin="1" end="${requestScope.END_PAGE}" var="i">
                                                <li class="page-item"><a class="page-link" href="HomeController?index=${i}">${i}</a></li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${requestScope.CATEGORY !=null}"> 
                                                <c:forEach begin="1" end="${requestScope.END_PAGE}" var="i">
                                                <li class="page-item"><a class="page-link" href="SearchShoesByCategoryID?index=${i}&&categoryID=${requestScope.CATEGORY}">${i}</a></li>

                                            </c:forEach>
                                        </c:if>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                </section>
            </div>
            <footer class="bg-dark text-white">
                <div class="container py-4">
                    <div class="row py-5">
                        <div class="col-md-4 mb-3 mb-md-0">
                            <h6 class="text-uppercase mb-3">Customer services</h6>
                            <ul class="list-unstyled mb-0">
                                <li><a class="footer-link" href="#">Help &amp; Contact Us</a></li>
                                <li><a class="footer-link" href="#">Returns &amp; Refunds</a></li>
                                <li><a class="footer-link" href="#">Online Stores</a></li>
                                <li><a class="footer-link" href="#">Terms &amp; Conditions</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4 mb-3 mb-md-0">
                            <h6 class="text-uppercase mb-3">Company</h6>
                            <ul class="list-unstyled mb-0">
                                <li><a class="footer-link" href="#">What We Do</a></li>
                                <li><a class="footer-link" href="#">Available Services</a></li>
                                <li><a class="footer-link" href="#">Latest Posts</a></li>
                                <li><a class="footer-link" href="#">FAQs</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h6 class="text-uppercase mb-3">Social media</h6>
                            <ul class="list-unstyled mb-0">
                                <li><a class="footer-link" href="#">Twitter</a></li>
                                <li><a class="footer-link" href="#">Instagram</a></li>
                                <li><a class="footer-link" href="#">Tumblr</a></li>
                                <li><a class="footer-link" href="#">Pinterest</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="border-top pt-4" style="border-color: #1d1d1d !important">
                        <div class="row">
                            <div class="col-lg-6">
                                <p class="small text-muted mb-0">&copy; 2020 All rights reserved.</p>
                            </div>
                            <div class="col-lg-6 text-lg-right">
                                <p class="small text-muted mb-0">Template designed by <a class="text-white reset-anchor" href="https://bootstraptemple.com/p/bootstrap-ecommerce">Bootstrap Temple</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- JavaScript files-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/lightbox2/js/lightbox.min.js"></script>
            <script src="vendor/nouislider/nouislider.min.js"></script>
            <script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
            <script src="vendor/owl.carousel2/owl.carousel.min.js"></script>
            <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
            <script src="js/front.js"></script>
            <!-- Nouislider Config-->
            <script>
                var range = document.getElementById('range');
                noUiSlider.create(range, {
                    range: {
                        'min': 0,
                        'max': 2000
                    },
                    step: 5,
                    start: [100, 1000],
                    margin: 300,
                    connect: true,
                    direction: 'ltr',
                    orientation: 'horizontal',
                    behaviour: 'tap-drag',
                    tooltips: true,
                    format: {
                        to: function (value) {
                            return '$' + value;
                        },
                        from: function (value) {
                            return value.replace('', '');
                        }
                    }
                });

            </script>
            <script>
                // ------------------------------------------------------- //
                //   Inject SVG Sprite - 
                //   see more here 
                //   https://css-tricks.com/ajaxing-svg-sprite/
                // ------------------------------------------------------ //
                function injectSvgSprite(path) {

                    var ajax = new XMLHttpRequest();
                    ajax.open("GET", path, true);
                    ajax.send();
                    ajax.onload = function (e) {
                        var div = document.createElement("div");
                        div.className = 'd-none';
                        div.innerHTML = ajax.responseText;
                        document.body.insertBefore(div, document.body.childNodes[0]);
                    }
                }
                // this is set to BootstrapTemple website as you cannot 
                // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
                // while using file:// protocol
                // pls don't forget to change to your domain :)
                injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');

            </script>
            <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        </div>
        <c:set value="${requestScope.OUT}" var="out"/>
        <c:if test="${not empty out}">
            <script>
                alert('${out}');
            </script>
        </c:if>

        <c:if test="${requestScope.CHECK_OUT != null}">
            <script>
                alert('${requestScope.CHECK_OUT}');
            </script>
        </c:if>
    </body>
</html>
