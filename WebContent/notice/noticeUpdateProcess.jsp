<%@page import="com.yr.notice.NoticeDAO"%>
<%@page import="sun.util.locale.ParseStatus"%>
<%@page import="java.sql.Date"%>
<%@page import="com.yr.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

NoticeDTO dto = new NoticeDTO();
dto.setTitle(request.getParameter("title"));
dto.setContents(request.getParameter("contents"));

NoticeDAO dao = new NoticeDAO();
int result = dao.update(dto);

String msg = "Update Fail";
if(result>0) {
	msg = "Update Success";
	request.setAttribute("message", msg);
	request.setAttribute("path", "./noticeList.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../commom/test/result.jsp");
	view.forward(request, response);
} else {
	response.sendRedirect("./noticeUpdate.jsp?num="+dto.getNum());
}



%>