<%@page import="com.estsoft.guestbook.vo.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@page import="com.estsoft.db.MySQLGuestBookConnection"%>
<%@page import="com.estsoft.guestbook.dao.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!--  미친 뭐지 뭔가를 매우 많이 안썼음이 분명하다.  수업 시간에 씀-->
<!--  여기에 list 사용을 위한 Dao와 getList()로 받아온 리스트를 정의해 준다. -->
<% 
	GuestBookDao dao = new GuestBookDao(new MySQLGuestBookConnection( ) );
	List<GuestBookVo> list = dao.getList();
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="add.jsp" method="post">
	<table border=1 width=500>
		<tr>
			<td>이름</td><td><input type="text" name="name"></td>
			
			<!-- 왜 계속 Column '----' cannot be null 거리나 했더니
					reg_date의 경우에는 INSERT때 NOW() 라고 써줘야 하는데 안되서 그런 거였고
					passwd의 경우에는 아래 코드의 타입과 name 부분에서 pass 라고 쓰여진 곳이 있어서 그랬던 듯..?ㅜㅠㅜㅠ -->
			
			<td>비밀번호</td><td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
		</tr>
		<tr>
			<td colspan=4 align=right>
			<input type="submit" VALUE=" 확인 "></td>
		</tr>
	</table>
	</form>
	<p>뭐야 왜 안보이지? form 밖에 것은 안보여??;<br>
	이건 보이는데 width에 또 남모를 에러가 난다;;<br>
	아무래도 아직 테이블에 내용이 안들어가서 그런가.. insert 고치는 중;<br>
	왜  코드를 복붙수준으로 베껴써도 에러가 나지ㅋㅋㅋㅋㅋ<br>
	그랬던 것이다 INSERT CANNOT BE NULL들 고치니까 테이블 표시가 된다 ㅜㅠㅜㅠㅜ 우왕</p>
	
	<!--  form을 닫아주고 여기부터 써야 하는 쿼리가 들어간다. 
			list 개수를 세는 변수 count와 목록에 표시할 숫자를 조정해주는 index변수, 
			<GuestBookVo vo : list> 를 위한 for each 문 -->
	<%
		int count = list.size();
		int index = 0;
		for(GuestBookVo vo : list) {		
	%>
	<br>
	<!--  그러니까..? 해야 하는 것은 이쪽에 for each 문을 이용해서 데이터베이스에서 계속 읽어오는 거라는 말이네... -->
	<!--  원래는 form으로 감싼 부분 안이었는데 여기는 굳이 전송할 내용이 없는 구역이니까 form에서 빼도 되는 것 같다. -->
	<table width = 510 border = 1>
		<tr>
			<td>[<%=count-index++ %>]</td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getRegDate() %></td>
			<td><a href="deleteform.jsp?no=<%=vo.getNo()%>">삭제</a></td>
		</tr>
		<tr>
		<!--  아 엔터 처리를 해주는 구간이구나.... 이렇게 바꿔줘야 하나 보다. -->
			<td colspan=4><%=vo.getMessage().replaceAll("\r\n", "<br>") %></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>