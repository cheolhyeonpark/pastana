<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>pastana</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.html">PASTANA</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">HOME</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="menu.html">MENU</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.html">ABOUT</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="list">RESERVATION</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="bgphoto reservephoto">
        <div class="title">
            <h1>RESERVATION</h1>
            <hr class="line">
            <h5>BOOK A TABLE OR ROOMS FOR PRIVATE DINING</h5>
        </div>
    </div>

    <div class="container contents">
        <div class="row">
            <div class="col-md-5">
                <form>
                    <div>
                        Title : ${reservation.title }
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            Date : ${reservation.date }
                        </div>
                        <div class="col-md-6">
                            Time : ${reservation.time }
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            Number of Guest : ${reservation.guest }
                        </div>
                        <div class="col-md-6">
                            Phone : ${reservation.phone }
                        </div>
                    </div>
                    <div>
                        Name : ${reservation.name }
                    </div>
                    <div>
                        Message : ${reservation.message }    
                    </div>
                    <hr>
                    <a class="btn btn-dark" href="modify?reNo=${reservation.reNo }">modify</a>
                    <a class="btn btn-dark" href="delete?reNo=${reservation.reNo }">remove</a>
                </form>
            </div>
            <div class="col-md-7" style="padding-bottom: 19px;">
                <div class="bgphoto endphoto" style="width: 100%; height: 100%;"></div>
            </div>
        </div>
    </div>

    <footer style="margin-top: 30px;">
        <div class="bottomfoot">
            <div class="container">
                <p>
                    Copyright © 2018 All rights reserved
                </p>
            </div>
        </div>
    </footer>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>