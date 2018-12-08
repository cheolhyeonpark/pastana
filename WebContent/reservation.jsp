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
        <div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">이름</th>
                        <th scope="col">제목</th>
                        <th scope="col">예약일</th>
                    </tr>
                </thead>
                <tbody>
               		<c:forEach var="reservation" items="${list}">
	                    <tr>
	                        <th scope="row">${reservation.reNo }</th>
	                        <td>${reservation.name }</td>
	                        <td><a href="view?reNo=${reservation.reNo }">${reservation.title }</a></td>
	                        <td>${reservation.date }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div style="text-align: right">
                <a class="btn btn-dark" href="add.html">예약하기</a>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <c:choose>
	                  	<c:when test="${start != 1 }">
	                   		<li class="page-item">
	                   	</c:when>
	                   	<c:otherwise>
	                   		<li class="page-item disabled">
	                   	</c:otherwise>
                   	</c:choose>
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <c:forEach var="i" begin="${start }" end="${end }" step="1">
                    	<c:choose>
                    	<c:when test="${current == i}">
	                    	<li class="page-item active">
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item">
                    	</c:otherwise>
                    </c:choose>
		                    <a class="page-link" href="list?current=${i }">${i }</a>
		                </li>
                    </c:forEach>
                    <c:choose>
                    	<c:when test="${end != last }">
                    		<li class="page-item">
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item disabled">
                    	</c:otherwise>
                    </c:choose>
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
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