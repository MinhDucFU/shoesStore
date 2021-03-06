<%-- 
    Document   : detail
    Created on : Jul 1, 2021, 7:38:05 PM
    Author     : Minh Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <div class="page-holder bg-light">
            <!-- navbar-->
            <header class="header bg-white">
                <div class="container px-0 px-lg-3">
                    <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="MainController"><span class="font-weight-bold text-uppercase text-dark">Boutique</span></a>
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">              
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="MainController">Shop</a>
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
            
            <section class="py-5">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-lg-6">
                            <!-- PRODUCT SLIDER-->
                            <c:set value="${requestScope.SHOES}" var="shoes"/>
                            <div class="row m-sm-0">

                                <div class="col-sm-10 order-1 order-sm-2">
                                    <div class="owl-carousel product-slider" data-slider-id="1"><a class="d-block" href="img/${shoes.image}" data-lightbox="product" title="Product item 1"><img class="img-fluid" src="img/${shoes.image}" alt="..."></a><a class="d-block" href="img/product-detail-2.jpg" data-lightbox="product" title="Product item 2"><img class="img-fluid" src="img/product-detail-2.jpg" alt="..."></a><a class="d-block" href="img/product-detail-3.jpg" data-lightbox="product" title="Product item 3"><img class="img-fluid" src="img/product-detail-3.jpg" alt="..."></a><a class="d-block" href="img/product-detail-4.jpg" data-lightbox="product" title="Product item 4"><img class="img-fluid" src="img/product-detail-4.jpg" alt="..."></a></div>
                                </div>
                            </div>
                        </div>
                        <!-- PRODUCT DETAILS-->
                        <div class="col-lg-6">

                            <h1>${shoes.shoesName}</h1>
                            <p class="text-muted lead">${shoes.price}$</p>
                            <p class="text-small mb-4">${shoes.description}</p>
                            <div class="row align-items-stretch mb-4">
                                <div class="col-sm-5 pr-sm-0">
                                    <div class="border d-flex align-items-center justify-content-between py-1 px-3 bg-white border-white"><span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
                                        <div class="quantity">
                                            <button class="dec-btn p-0"><i class="fas fa-caret-left"></i></button>
                                            <input class="form-control border-0 shadow-0 p-0" type="text" value="1">
                                            <button class="inc-btn p-0"><i class="fas fa-caret-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 pl-sm-0"><a class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" href="AddToCartController?shoesID=${shoes.shoesID}">Add to cart</a></div>
                            </div>
                            <ul class="list-unstyled small d-inline-block">
                                <li class="px-3 py-2 mb-1 bg-white"><strong class="text-uppercase">SKU:</strong><span class="ml-2 text-muted">039</span></li>
                                <li class="px-3 py-2 mb-1 bg-white text-muted"><strong class="text-uppercase text-dark">Category:</strong><a class="reset-anchor ml-2" href="#">${shoes.categoryID}</a></li>
                                <li class="px-3 py-2 mb-1 bg-white text-muted"><strong class="text-uppercase text-dark">Tags:</strong><a class="reset-anchor ml-2" href="#">Innovation</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- DETAILS TABS-->
                    <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a></li>
                        <li class="nav-item"><a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a></li>
                    </ul>
                    <div class="tab-content mb-5" id="myTabContent">
                        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                            <div class="p-4 p-lg-5 bg-white">
                                <h6 class="text-uppercase">Product description </h6>
                                <p class="text-muted text-small mb-0">${shoes.description}</p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                            <div class="p-4 p-lg-5 bg-white">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="media mb-3"><img class="rounded-circle" src="img/customer-1.png" alt="" width="50">
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 text-uppercase">Jason Doe</h6>
                                                <p class="small text-muted mb-0 text-uppercase">20 May 2020</p>
                                                <ul class="list-inline mb-1 text-xs">
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star-half-alt text-warning"></i></li>
                                                </ul>
                                                <p class="text-small mb-0 text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                        </div>
                                        <div class="media"><img class="rounded-circle" src="img/customer-2.png" alt="" width="50">
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 text-uppercase">Jason Doe</h6>
                                                <p class="small text-muted mb-0 text-uppercase">20 May 2020</p>
                                                <ul class="list-inline mb-1 text-xs">
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star-half-alt text-warning"></i></li>
                                                </ul>
                                                <p class="text-small mb-0 text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- RELATED PRODUCTS-->
                    <h2 class="h5 text-uppercase mb-4">Related products</h2>
                    <div class="row">
                        <!-- PRODUCT-->
                        <c:forEach items="${requestScope.LIST_SHOES}" var="shoes">
                            <div class="col-lg-3 col-sm-6">
                                <div class="product text-center skel-loader">
                                    <div class="d-block mb-3 position-relative"><a class="d-block" href="MainController?action=detail&&shoesID=${shoes.shoesID}"><img class="img-fluid w-100" src="img/${shoes.image}" alt="..."></a>
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

                    </div>
                </div>
            </section>
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
    </body>
</html>
