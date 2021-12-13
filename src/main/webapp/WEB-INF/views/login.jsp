<%--
    TODO: jsp
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 2021/10/27
  Time: 8:18 오후
  To change this template use File | Settings | File Templates.
--%>
<%-- copyright https://homnay.tistory.com/entry/HTMLCSS-초간단-로그인폼-만들기-LoginForm --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/login.css">
</head>
<body>
<form action="index" method="post">
    <div class="wrap">
        <div class="login">
            <h2>Anonymous-Chat</h2>
            <div class="login_sns">
                <li><a href=""><i class="fab fa-instagram"></i></a></li>
                <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                <li><a href=""><i class="fab fa-twitter"></i></a></li>
            </div>
            <div class="login_id">
                <h4>E-mail</h4>
                <input type="email" name="userEmail" id="emailInput" placeholder="Email">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="userPassword" id="passwordInput" placeholder="Password">
            </div>
            <div class="room_id">
                <h4>RoomID</h4>
                <input type="text" name="roomID" id="roomid" placeholder="roomid">
            </div>
            <div class="login_etc">
                <div class="checkbox">
                    <input type="checkbox" name="" id="checkInput"> Remember Me?
                </div>
                <div class="forgot_pw">
                    <a href="">Forgot Password?</a>
                </div>
            </div>
            <div class="submit">
                <input type="submit" value="enter">
            </div>
        </div>
    </div>
</form>
</body>
</html>


<%--<html>--%>
<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--    <title>Insert title here</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="index" method="post">--%>
<%--    <table border="1">--%>
<%--        <tr><!-- 첫번째 줄 시작 -->--%>
<%--            <td>아 이 디</td>--%>
<%--            <td><input type="text" name="userEmail"></td>--%>
<%--            <td rowspan="2"><input type="submit" value="로그인"></td>--%>
<%--        </tr><!-- 첫번째 줄 끝 -->--%>
<%--        <tr><!-- 두번째 줄 시작 -->--%>
<%--            <td>비밀번호</td>--%>
<%--            <td><input type="text" name="userPassword"></td>--%>
<%--        </tr><!-- 두번째 줄 끝 -->--%>
<%--        <tr>--%>
<%--            <td>방 번 호</td>--%>
<%--            <td><input type="text" name="roomid"></td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>