<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bbs.BbsDAO" %>
<%@page import="bbs.Bbs" %>
<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> JSP 게시판 웹 사이트</title>
</head>
<body>



 <%
 
 String userID = null;
if(session.getAttribute("userID") !=null){
	 userID = (String) session.getAttribute("userID");
}
if(userID == null){
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

else{
	  if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") ==null 
			  || request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals(""))  // 넘어온 값들을 확인함  글의제목과 글의내용이 입력되어야지 수정이됨
	  {
		 PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('입력되지않은사항이있습니다.')");
		   script.println("history.back()");
		   script.println("</script>");
	  }
	  else
	  {
		  BbsDAO bbsDAO = new BbsDAO();
		   int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));    
	
		   if(result == -1) //데이터베이스 오류
		   {
			   PrintWriter script =response.getWriter();
			   script.println("<script>");
			   script.println("alert('글수정에 실패했습니다..')");
			   script.println("history.back()");
			   script.println("</script>");
			   
			   } 
	  		   else{
			   
			   PrintWriter script =response.getWriter();
			   script.println("<script>");
			   script.println("location.href ='BBS.jsp'");
			   script.println("</script>");
			   
			   
		   }
		  
	  } // 입력한데이터  입력되지않은사항이있는지확인하는 if문	
	
	
	
	
	
	
}
 

 
   
 %>

</body>
</html>