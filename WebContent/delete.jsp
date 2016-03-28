<%@page import="com.estsoft.db.MySQLGuestBookConnection"%>
<%@page import="com.estsoft.guestbook.vo.GuestBookVo"%>
<%@page import="com.estsoft.guestbook.dao.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		//이미 add를 통해 UTF-8로 인코딩 되어 있는 애들이니 따로 해주지는 않은 듯 하다.
		
		//DELETE에 필요한 것은 오직 등록 번호와 비밀번호 뿐이므로 변수 구현도 이렇게 해주면 된다.
		//걍 자주 봄으로써 익숙해지는 것이 나을 것 같아...
		Long no = Long.parseLong(request.getParameter("no"));
		String password = request.getParameter("password");
		
		System.out.println(no);
		
		GuestBookVo vo = new GuestBookVo();
		vo.setNo(no);
		vo.setPasswd(password);
		
		GuestBookDao dao = new GuestBookDao( new MySQLGuestBookConnection( ) );
		//dao가 DB와 통신한다. for each문을 돌리는 게 아니라 DB에서 알아서 맞게 셀렉!! 이 걍 자바 돌리는 것과 다른 점!!
		//오 생각보다 신기한거 하고 있었잖아...
		dao.delete(vo);
				
		response.sendRedirect("/GuestBook");
		
%>
