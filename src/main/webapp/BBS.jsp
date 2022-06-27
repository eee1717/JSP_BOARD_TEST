<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.io.PrintWriter" %>
<%@page import ="bbs.BbsDAO" %>
<%@page import ="bbs.Bbs" %>
<%@page import ="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title> JSP 게시판 로그인페이지</title>
<!-- 게시판 글제목 색깔 변경 스타일 명렁어 -->
<style type="text/css">
a, a:hover {
      color: black;
      text-decoration: none;
} 
</style>
</head>
<body>

<%
   String userID = null;
   if(session.getAttribute("userID") != null){
	   userID =(String) session.getAttribute("userID");
   }
   /* 몇번쨰 페이지인지 알기위해서 만든코드  */
   int pageNumber = 1;
   if (request.getParameter("pageNumber") !=null ){
	   pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
   }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="Join.jsp">JSP 게시판 웹사이트</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="main.jsp">메인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BBS.jsp">게시판</a>
        </li>
        
       		 <%
  			if(userID ==null){
			%> 
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 드롭다운관리 </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="login.jsp">로그인</a></li>    
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="Join.jsp">회원가입</a></li>
          </ul>
        </li>
        
        <%
 			
  			} else{
	  
		%>	  
		 <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 드롭다운관리 </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
             <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
        
          
          </ul>
        </li>
		
	
		
		
		
		
        
        <%	  
		  }
		%>
        
  
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">몰라</a>
        </li>
      </ul>
  
    </div>
  </div>
</nav>



<div class="container">
  <div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid gray">
      <thead>
        <tr>
          <th style="background-color: gray; text-align: center;">번호</th>
          <th style="background-color: gray; text-align: center;">제목</th>
          <th style="background-color: gray; text-align: center;">작성자</th>
          <th style="background-color: gray; text-align: center;">작성일</th>
        </tr>
      </thead>
      <tbody>
      <%
         BbsDAO bbsDAO = new BbsDAO();
         ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
         for(int i =0; i <list.size(); i++)
         {
      %>
        <tr>
             <td><%= list.get(i).getBbsID() %></td>
         	 <td><a href ="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"> <%=list.get(i).getBbsTitle() %></a></td>
             <td><%= list.get(i).getUserID() %> </td>
             <td><%= list.get(i).getBbsDate().substring(0,11)+ list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14, 16) + "분" %> </td>
        </tr>
        <%
         }
        %>
      </tbody>
    </table>
           <!-- 게시판 페이지  모양부분 -->
           <%
            if(pageNumber !=1)
            {	   
           %>
            <a href="BBS.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
            
            <%
            } if(bbsDAO.nextPage(pageNumber))
            
            {
            %>
               <a href="BBS.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arraw-left">다음</a>
            <% 
            }
            
            %>
            
 			 <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
  </div>



</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>