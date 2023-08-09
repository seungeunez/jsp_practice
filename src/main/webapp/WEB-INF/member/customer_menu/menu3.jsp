<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<form action="mypage.do?menu=3" method="post" >
		<input type="password" name="pw" placeholder="비밀번호" /> 
		<input type="button" value="회원탈퇴" onclick="deleteMember()" />
	</form>
</div>
