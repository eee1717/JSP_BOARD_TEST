<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title> JSP 게시판 회원가입페이지</title>
</head>
<body>



<div class="collapse" id="navbarToggleExternalContent">
  <div class="bg-dark p-4">
   
   <a class="navbar-brand" href="main.jsp">JSP 게시판 회원가입</a>
   
   
  </div>
  
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

<ul class="nav navbar-nav">

<li><a href="main.jsp">메인</a></li>

<li><a href="bbs.jsp">게시판</a></li>

</ul>

<ul class="nav navbar-nav navbar-right">

<li class="dropdown">

<a href="#" class="dropdown-toggle"

data-toggle="dropdown" role="button" aria-haspopup="true"

aria-expanded="false">접속하기<span class="caret"></span></a>

<ul class="dropdown-menu">

<li class="active"><a href="login.jsp">로그인</a></li>

<li><a href="join.jsp">회원가입</a></li>
</ul>
</li>
</ul>
</div>
  
  
  
</div>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>

<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">

<form method="post" action="JoinAction.jsp">
<h3 style="text-align: center;">회원가입화면</h3>
<div class="form-group">
<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
</div>
<div class="form-group">
<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
</div>

<div class="form-group" style="text-align:center;">

<div class="btn-group" data-toggle="buttons">
<label class="btn btn-primary active">
<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자 
</label>
<label class="btn btn-primary">
<input type="radio" name="userGender" autocomplete="off" value="여자"> 여자
</label>
</div>  
</div>
<div class="form-group">
<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="50">
</div>
<input type="submit" class="btn btn-primary form-control" value="회원가입">
</form>

</div>
<div class="col-lg-4"></div>
</div>
</div>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>