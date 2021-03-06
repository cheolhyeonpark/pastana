<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <form action="modify" method="post" id="form1">
                	<div class="form-group" style="display: none">
                		<input type="number" class="form-control" id="reNo" name="reNo" value="${reservation.reNo }">
                	</div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Event Name" value="${reservation.title }">
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="date" class="form-control" id="date" name="date" placeholder="Event Date" value="${reservation.date }">
                        </div>
                        <div class="col-md-6 form-group">
                            <select class="form-control" id="time" name="time">
                                <option value='0'>Event Time</option>
                                <c:choose>
                                	<c:when test="${reservation.time == 6}">
                                		<option value="6" selected>6pm</option>	
                                	</c:when>
                                	<c:otherwise>
                                		<option value="6">6pm</option>
                                	</c:otherwise>
                                </c:choose>
                                <c:choose>
                                	<c:when test="${reservation.time == 7}">
                                		<option value="7" selected>7pm</option>	
                                	</c:when>
                                	<c:otherwise>
                                		<option value="7">7pm</option>
                                	</c:otherwise>
                                </c:choose>
                                <c:choose>
                                	<c:when test="${reservation.time == 8}">
                                		<option value="8" selected>8pm</option>
                                	</c:when>
                                	<c:otherwise>
                                		<option value="8">8pm</option>
                                	</c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <select class="form-control" id="guest" name="guest">
                                <option value='0'>Number of Guest</option>
                                <c:choose>
                                	<c:when test="${reservation.guest == 1}">
                                		<option value="1" selected>1</option>	
                                	</c:when>
                                	<c:otherwise>
                                		<option value="1">1</option>
                                	</c:otherwise>
                                </c:choose>
                                <c:choose>
                                	<c:when test="${reservation.guest == 2}">
                                		<option value="2" selected>2</option>	
                                	</c:when>
                                	<c:otherwise>
                                		<option value="2">2</option>
                                	</c:otherwise>
                                </c:choose>
                                <c:choose>
                                	<c:when test="${reservation.guest == 3}">
                                		<option value="3" selected>3</option>	
                                	</c:when>
                                	<c:otherwise>
                                		<option value="3">3</option>
                                	</c:otherwise>
                                </c:choose>
                                <c:choose>
                                	<c:when test="${reservation.guest == 4}">
                                		<option value="4" selected>4</option>	
                                	</c:when>
                                	<c:otherwise>
                                		<option value="4">4</option>
                                	</c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone Number" value="${reservation.phone }">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${reservation.name }">
                        </div>
                        <div class="col-md-6 form-group">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" id="message" name="message" rows="5">${reservation.message }</textarea>
                    </div>
                    <hr>
                    <a class="btn btn-dark" href="#" onclick="clicksubmit()">SEND REQUEST</a>
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
    <script>
    	function clicksubmit() {
    		if($("#title").val()==null || $("#title").val()=='') {
				alert("제목을 적어주세요");
				return;
			}
    		if($("#date").val()==null || $("#date").val()=='') {
				alert("날짜를 정해주세요");
				return;
			}
    		if($("#time").val()==null || $("#time").val()=='0') {
				alert("시간을 정해주세요");
				return;
			}
    		if($("#guest").val()==null || $("#guest").val()=='0') {
				alert("인원을 선택해주세요.");
				return;
			}
    		if($("#phone").val()==null || $("#phone").val()=='') {
				alert("전화번호를 적어주세요.");
				return;
			}
    		if($("#name").val()==null || $("#name").val()=='') {
				alert("이름을 적어주세요.");
				return;
			}
			if($("#password").val()==null || $("#password").val()=='') {
				alert("비밀번호를 적어주세요.");
				return;
			}
			$("#form1").submit();
		}
    </script>
</body>

</html>