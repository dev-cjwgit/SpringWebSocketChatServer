<%--
    TODO: jsp
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 2021/10/27
  Time: 8:18 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form action="index" method="post">
    <table border="1">
        <tr><!-- 첫번째 줄 시작 -->
            <td>아 이 디</td>
            <td><input type="text" name="userEmail"></td>
            <td rowspan="2"><input type="submit" value="로그인"></td>
        </tr><!-- 첫번째 줄 끝 -->
        <tr><!-- 두번째 줄 시작 -->
            <td>비밀번호</td>
            <td><input type="text" name="userPassword"></td>
        </tr><!-- 두번째 줄 끝 -->
        <tr>
            <td>방 번 호</td>
            <td><input type="text" name="roomName"></td>
        </tr>
    </table>
</form>
</body>
</html>