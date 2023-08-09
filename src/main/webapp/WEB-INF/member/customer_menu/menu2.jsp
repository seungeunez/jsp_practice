<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<form action="mypage.do?menu=2" method="post" >
		<input type="password" name="pw" placeholder="현재 비밀번호"  class="mb-2"  /> <br />
		<input type="password" name="pw1" placeholder="새 비밀번호" class="mb-2"  /> <br />
		<input type="password" name="pw2" placeholder="새 비밀번호 확인" class="mb-2" /> <br />
		<input type="button" value="변경" onclick="updatePW()"  />
	</form>
</div>
