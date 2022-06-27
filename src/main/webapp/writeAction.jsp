<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bbs.BbsDAO" %>
<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
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
}   // session을 확인해서 이미 있는 아아디인지확인
 
else{
	  if(bbs.getBbsTitle() == null || bbs.getBbsContent() ==null )
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
		   int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());    
	
		   if(result == -1) //데이터베이스 오류
		   {
			   PrintWriter script =response.getWriter();
			   script.println("<script>");
			   script.println("alert('글쓰기에 실패했습니다..')");
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