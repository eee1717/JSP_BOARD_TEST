<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title> JSP 게시판 로그인페이지</title>
</head>
<body>

<%
   String userID = null;
   if(session.getAttribute("userID") != null){
	   userID =(String) session.getAttribute("userID");
   }
%>


<div class="collapse" id="navbarToggleExternalContent">
 
 
  <div class="bg-dark p-4">
   
   <a class="navbar-brand" href="join.jsp">JSP 게시판 웹사이트</a> 
   
		<ul class="nav navbar-nav">
			<li class="active"><a href="main.jsp">메인</a></li>
			<li><a href="BBS.jsp">게시판</a></li>
		</ul>
<%
  if(userID ==null){
%> 
	
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
	
	
	
<%
  } else{
	  
%>	  
	
<ul class="nav navbar-nav navbar-right">	
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
   회원관리
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
	<li><a href="logoutAction.jsp">로그아웃</a></li>
	
  </ul>
</div>	
</ul>		

	  
<%	  
  }
%>




  </div>  <!-- bg-dark p-4 끝 -->
 
 
</div> <!-- navbarToggleExternalContent끝 -->


<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
  </div>
  
</nav>








<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>