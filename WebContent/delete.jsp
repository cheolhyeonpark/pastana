<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    	<div class="card" style="width: 20rem; margin : auto;">
		  <div class="card-body">
		    <h4 class="card-title">REMOVE</h4>
		    <h6 class="card-subtitle mb-2 text-muted">비밀번호를 입력해주세요.</h6>
	    	<form action="delete" method="post" id="form1">
              	<div class="form-group" style="display: none">
               		<input type="number" class="form-control" id="reNo" name="reNo" value="${reNo }">
               	</div>
                <div class="form-group">
                 <p class="card-text">
                     <input type="password" class="form-control" id="password" name="password" placeholder="password">
                 </p>
                </div>
            </form>
		    <hr>
		    <a class="btn btn-dark btn-md" href="#" onclick="clicksubmit()">REMOVE</a>
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
			if($("#password").val()==null || $("#password").val()=='') {
				alert("비밀번호를 적어주세요.");
				return;
			}
			$("#form1").submit();
		}
    </script>
</body>

</html>