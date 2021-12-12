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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
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
            <div class="room_id">
                <h4>RoomID</h4>
                <input type="text" name="roomID" id="roomid" placeholder="roomid">
            </div>

            <div class="login_id">
                <h4>E-mail</h4>
                <input type="email" name="userEmail" id="emailInput" placeholder="Email">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="userPassword" id="passwordInput" placeholder="Password">
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
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Noto Sans KR", sans-serif;
    }

    a {
        text-decoration: none;
        color: black;
    }

    li {
        list-style: none;
    }

    .wrap {
        width: 100%;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(0, 0, 0, 0.1);
    }

    .login {
        width: 70%;
        height: 700px;
        background: white;
        border-radius: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    h2 {
        color: tomato;
        font-size: 2em;
    }

    .login_sns {
        padding: 20px;
        display: flex;
    }

    .login_sns li {
        padding: 0px 15px;
    }

    .login_sns a {
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 10px;
        border-radius: 50px;
        background: white;
        font-size: 20px;
        box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px rgba(0, 0, 0, 0.1);
    }

    .room_id {
        margin-top: 20px;
        width: 80%;
    }

    .room_id input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
    }

    .login_id {
        margin-top: 20px;
        width: 80%;
    }

    .login_id input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
    }

    .login_pw {
        margin-top: 20px;
        width: 80%;
    }

    .login_pw input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
    }

    .login_etc {
        padding: 10px;
        width: 80%;
        font-size: 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: bold;
    }

    .submit {
        margin-top: 50px;
        width: 80%;
    }

    .submit input {
        width: 100%;
        height: 50px;
        border: 0;
        outline: none;
        border-radius: 40px;
        background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
        color: white;
        font-size: 1.2em;
        letter-spacing: 2px;
    }
</style>
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