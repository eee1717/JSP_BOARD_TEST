<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title> JSP 게시판 로그인페이지</title>
</head>
<body>







<nav class="navbar navbar-dark bg-dark">

<div class="bg-dark p-4">
   <a class="navbar-brand" href="join.jsp">JSP 게시판 로그인</a>
</div>


<ul class="nav navbar-nav">
	<li><a href="main.jsp">메인</a></li>
	<li><a href="BBS.jsp">게시판</a></li>
</ul>

<ul class="nav navbar-nav navbar-right">

	<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
   회원관리
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
		<li><a href="login.jsp">로그인</a></li>
		<li><a href="Join.jsp">회원가입</a></li>
  </ul>
</div>	

</ul>

	  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	  
</nav>

<div class="container">
<div class="col-lg-4"></div>

<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post" action="loginAction.jsp">
<h3 style="text-align: center;">로그인화면</h3>
<div class="form-group">
<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
</div>
<div class="form-group">
<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
</div>
<input type="submit" class="btn btn-primary form-control" value="로그인">
</form>
</div>
<div class="col-lg-4"></div>
</div>
</div>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>