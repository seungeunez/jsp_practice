<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<form action="mypage.do?menu=1" method="post" >
		이름 <input type="text" name="name" placeholder="이름" value="${obj.name}" />
		나이 <input type="number" name="age" placeholder="나이" value="${obj.age}" /> 
		<input type="button" value="정보변경" onclick="updateMember()" />
	</form>
</div>
