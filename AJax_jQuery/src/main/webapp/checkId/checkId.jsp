<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true" %><%--XML태그 시작전의 공백 제거 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--DB연동 => 만약에 아이디가 'hong'이면 이미 DB에 저장된 아이디로 취급--%>
<c:set var="result" value="false"/>
<c:if test=" ${param.user_id=='hong'} "> <!-- 자바가 아니기 때문에 equals를 쓸 필요가 없다. -->
    <c:set var="result" value="true"/>
</c:if>

<%--XML로 보내기 --%>
<?xml version="1.0" encoding="UTF-8"?>
<checkId>
    <result>${result}</result>
</checkId>