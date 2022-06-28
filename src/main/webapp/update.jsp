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
   if(userID == null) //로그인 하지않아서 userID가 없는경우
   {
		   PrintWriter script =response.getWriter();
		   script.println("<script>");
		   script.println("alert(' 로그인을 하세요.')");
		   script.println("location.href = 'login.jsp'");
		   script.println("</script>");   
   }	
    int bbsID = 0;
    if(request.getParameter("bbsID") != null){
    	bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
	if(bbsID == 0)
	{
		  PrintWriter script =response.getWriter();
		   script.println("<script>");
		   script.println("alert('유효하지않은글입니다..')");
		   script.println("location.href = 'BBS.jsp'");
		   script.println("</script>");   	  
   }
	Bbs bbs = new BbsDAO().getBbs(bbsID);  // 로그인한 아이디와 게시판을 작성한 아이디가 동일하지않으면 권한이없어서 수정불가
	if(!userID.equals(bbs.getUserID())){
		  PrintWriter script =response.getWriter();
		   script.println("<script>");
		   script.println("alert('권한이없습니다.')");
		   script.println("location.href = 'BBS.jsp'");
		   script.println("</script>"); 
		
	}
%>

<nav class="navbar navbar-dark bg-dark">

<div class="collapse" id="navbarToggleExternalContent">
 
 
  <div class="bg-dark p-4">
   
   <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a> 
   
		<ul class="nav navbar-nav">
			<li ><a href="main.jsp">메인</a></li>
			<li class="active"><a href="BBS.jsp">게시판</a></li>
		</ul>

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
  
   <form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
    <table class="table table-striped" style="text-align: center; border: 1px solid gray">
      <thead>
        <tr>
          <th colspan="2" style="background-color: gray; text-align: center;">게시판 글수정 양식</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
         </tr>    
         <tr>   
            <td><textarea  class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%=bbs.getBbsContent() %></textarea></td>
          
        </tr>
      </tbody>
     
    </table>
       <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
    </form>       

  </div>



</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>