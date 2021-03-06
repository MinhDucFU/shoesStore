<%-- 
    Document   : login
    Created on : Jun 3, 2021, 9:14:41 PM
    Author     : Minh Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>
       <header class="header bg-white">
                <div class="container px-0 px-lg-3">
                    <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="MainController"><span class="font-weight-bold text-uppercase text-dark">Boutique Shop</span></a>
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">

                               

                            </ul>
                           
                        </div>
                    </nav>
                </div>
            </header>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-t-50 p-b-90">
                    <form action="LoginController" method="POST" >
                        <span class="login100-form-title p-b-51">
                            Login
                        </span>


                        <div class="wrap-input100">
                            <input class="input100" type="text" name="txtEmail" value="${requestScope.EMAIL}" placeholder="Email">
                            <span class="focus-input100"></span>
                        </div> <font color="red">${sessionScope.ERROR_LOGIN}</font>


                        <div class="wrap-input100">
                            <input class="input100" type="password" name="txtPassword" placeholder="Password">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="container-login100-form-btn m-t-17">
                            <button class="login100-form-btn">
                                Login
                            </button>
                        </div>

                    </form>
                    <form action="MainController?action=viewCreate" method="POST" >
                        <div class="container-login100-form-btn m-t-17">
                            <button class="login100-form-btn">
                                Create an Account
                            </button>

                        </div>
                    </form>
                </div>
            </div>
        </div>	
        <c:set value="${requestScope.SUCCESS}" var="success"/>
        <c:if test="${not empty success}">
            <script>
            alert('${success}');
            </script>
        </c:if>
    </body>
</html>