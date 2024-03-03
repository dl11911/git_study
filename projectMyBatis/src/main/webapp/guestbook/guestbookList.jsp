<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="guestbook.bean.GuestbookDTO" %>
<%@ page import="guestbook.dao.GuestbookDAO" %>   
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // 데이터
    int pg = Integer.parseInt(request.getParameter("pg"));

	// 페이징 처리
	int totalA = GuestbookDAO.getInstance().getTotalA(); // 총 글 수
	int totalP = (totalA + 1) / 2; // 총 페이지 수
	
	// 1페이지당 2개씩
	int endNum = pg * 2;
	int startNum = endNum - 1;

    // DB에서 데이터 가져오기
    GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
    List<GuestbookDTO> list = guestbookDAO.guestbookList(startNum, endNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #currentPaging:hover {
        text-decoration: underline;
        background-color: red;
        font-size: 10pt;
    }
    #paging:hover {
        text-decoration: underline;
        font-size: 10pt;
    }
    table {
        border-collapse: collapse;
    }
    .separator {
        border-bottom: 2px solid red;
        frame: hsides;
        rules: rows;
    }
    .page-number {
        position: absolute;
        left: 10px;
        top: 10px;
    }
</style>
</head>
<body>
<form>
    <table border="1" cellpadding="7" >
    <% if(list != null) { %>
        <% for(int i=0; i<list.size(); i++) { %>
            <% GuestbookDTO guestbookDTO = list.get(i); %>
            <tr>
                <td>작성자</td>
                <td><%= guestbookDTO.getName() %></td> 
                <td>작성일</td>
                <td align="center">
                   <% if (guestbookDTO.getLogtime() != null) { %>
   		 	<%= new SimpleDateFormat("yyyy.MM.dd").format(guestbookDTO.getLogtime()) %>
				<% } %>
                </td>
            </tr>
            
            <tr>
                <td>이메일</td>
                <td align="center" colspan="3"><%= guestbookDTO.getEmail() %></td>
            </tr>
            
            <tr>
                <td>홈페이지</td>
                <td align="center" colspan="3"><%= guestbookDTO.getHomepage() %></td>
            </tr>
            
            <tr>
                <td>제목</td>
                <td align="center" colspan="3"><%= guestbookDTO.getSubject() %></td>
            </tr>
            <tr>
                <td align="center" colspan="4"><%= guestbookDTO.getContent() %></td>
            </tr>
            <br>
            <% if(i != list.size() - 1) { %>
                <tr class="separator">
                    <td colspan="4"></td>
                </tr>
            <% } %>
        <% } // for %>
    <% } // if %>
    </table>
     <div class="page-number">
        <% for (int i=1; i<=totalP; i++) { %>
            <% if(i==pg) { %>
                <a id="currentPaging" href="guestbookList.jsp?pg=<%= i %>"><%= i %></a>
            <% } else { %>
                <a id="paging" href="guestbookList.jsp?pg=<%= i %>"><%= i %></a>
            <% } %>
        <% } // for %>
    </div> 
</form>
</body>
</html>
