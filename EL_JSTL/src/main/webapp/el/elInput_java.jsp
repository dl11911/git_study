<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="elResult_java.jsp"> <!-- submit해서 보내기때문에 name,id,method필요없음 -->
      <h3>자바 클래스의 메소드를 이용</h3>
      <table border="1">
         <tr>
            <td width="50" align="center">X</td>
            <td>
               <input type="text" name="x" ><!-- id="x"유효성검사 안하기때문에 id 필요 x -->
               <!-- <div id="xDiv"></div> --><!-- 유효성검사 안하기때문에 필요 X -->
            </td>
         </tr>
         <tr>
            <td align="center">Y</td>
            <td><input type="text" name="y" ><!-- id="y"유효성검사 안하기때문에 id 필요 x -->
                 <!-- <div id="yDiv"></div> --><!-- 유효성검사 안하기때문에 필요 X -->
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" value="계산" >
               <input type="reset" value="취소">
             
            </td>
         </tr>
      </table>
   </form>
</body>
</html>