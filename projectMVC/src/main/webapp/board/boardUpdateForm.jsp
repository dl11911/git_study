<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
    <div id="section">
        <form action="/projectMVC/board/boardUpdate.do" method="post">
            <input type="hidden" id="seq" name="seq" value="${boardDTO.seq}">
            <table border="1" cellpadding="7" frame="hsides" rules="rows">
                <tr>
                    <th height="100" colspan="3">
                    <font size="7"><input type="text" id="subject" name="subject" value="${boardDTO.subject}"></font>
                </tr>

                <tr>
                    <td align="center" width="200">글번호:<span id="seqSpan">${boardDTO.seq}</span></td>
                    <td align="center" width="200">작성자:<span id="idSpan">${boardDTO.id}</span></td>
                    <td align="center" width="200">조회수:<span id="hitSpan">${boardDTO.hit}</span></td>
                </tr>

                <tr>
                    <td height="300" valign="top" colspan="3">
                        <textarea id="content" name="content" rows="10" cols="30">${boardDTO.content}</textarea>
                    </td>
                </tr>
            </table>
            <input type="submit" value="수정하기">
            <input type="button" value="목록" onclick="location.href='/projectMVC/board/boardList.do'">
        </form>
    </div>
</body>
</html>
