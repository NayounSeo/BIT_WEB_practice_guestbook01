<%@page import="com.estsoft.db.MySQLGuestBookConnection"%>
<%@page import="com.estsoft.guestbook.vo.GuestBookVo"%>
<%@page import="com.estsoft.guestbook.dao.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String message = request.getParameter("content");
		
		GuestBookVo vo =  new GuestBookVo();
		vo.setName(name);
		vo.setPasswd(password);
		vo.setMessage(message);
		
		GuestBookDao dao  = new GuestBookDao( new MySQLGuestBookConnection( ) );
		dao.insert(vo);
		
		response.sendRedirect("/GuestBook");
%>