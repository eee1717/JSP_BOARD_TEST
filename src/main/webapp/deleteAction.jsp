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
else
{  
		  BbsDAO bbsDAO = new BbsDAO();
		   int result = bbsDAO.delete(bbsID);    
	
		   if(result == -1) //데이터베이스 오류
		   {
			   PrintWriter script =response.getWriter();
			   script.println("<script>");
			   script.println("alert('글삭제에 실패했습니다..')");
			   script.println("history.back()");
			   script.println("</script>");
			   
			   } 
	  		   else //글삭제 성공시 
	  		   {
			   
			   PrintWriter script =response.getWriter();
			   script.println("<script>");
			   script.println("location.href ='BBS.jsp'");
			   script.println("</script>");
			   
			   
		   }
		  
	  } 
	
	
	
	
	
	

 

 
   
 %>

</body>
</html>