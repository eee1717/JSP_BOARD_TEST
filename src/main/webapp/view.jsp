<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.io.PrintWriter" %>
<%@page import ="bbs.Bbs" %>
<%@page import ="bbs.BbsDAO" %>
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
   int bbsID = 0;
   if(request.getParameter("bbsID") != null){
	   bbsID = Integer.parseInt(request.getParameter("bbsID"));
   }
   if(bbsID == 0)
   {
	   
	   PrintWriter script =response.getWriter();
	   script.println("<script>");
	   script.println("alert(' 유효하지않은 게시글입니다.')");
	   script.println("location.href = 'BBS.jsp'");
	   script.println("</script>");   
  }
   Bbs bbs = new BbsDAO().getBbs(bbsID);
%>

<nav class="navbar navbar-dark bg-dark">

<div class="collapse" id="navbarToggleExternalContent">
 
 
  <div class="bg-dark p-4">
   
   <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a> 
   
		<ul class="nav navbar-nav">
			<li ><a href="main.jsp">메인</a></li>
			<li class="active"><a href="BBS.jsp">게시판</a></li>
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

  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
  </div>
  
</nav>



<div class="container">
  <div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid gray">
      <thead>
        <tr>
          <th colspan="3" style="background-color: gray; text-align: center;">게시판 글 보기 </th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td style="width: 20%;">글제목 </td>
            <td colspan="2"><%= bbs.getBbsTitle() %> </td>
         </tr>    
         <tr>   
             <td>작성자 </td>
            <td colspan="2"><%= bbs.getUserID() %> </td>
        </tr>
         <tr>   
             <td>작성일자 </td>
            <td colspan="2"><%= bbs.getBbsDate().substring(0,11)+ bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14, 16) + "분" %> </td>
        </tr>
        
         <tr>   
             <td>내용 </td>
            <td colspan="2" style="min-height:200px; text-align: left;"><%= bbs.getBbsContent() %> </td>
        </tr>
      
      </tbody>
    </table>
       <a href="BBS.jsp" class="btn btn-primary">목록</a>
       
       <%
       
         if(userID != null && userID.equals(bbs.getUserID())) // userID(로그인상태인지확인하는것) 가 없지않으며 userID가 bbs.getUserID()와 일치한다면 실행시킨다.(본인계정의 아이디로만 수정과 삭제가 작동함) 
         {
        	 
       %> 	 
         	  <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정 </a>
         	  <a  onclick="return confirm('정말로 삭제하시겠습니까?')"  href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제 </a>
       <%
         }
       %>
       
       

        

  </div>



</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>