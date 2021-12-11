<%--
    TODO: jsp
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 2021/10/27
  Time: 8:18 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인 정보</title>
</head>
<body>
유저 아 이 디 : ${userID} <br>
유저 비밀번호 : ${userPW}
<div>
    <button type="button" onclick="openSocket();">대화방 참여</button>
    <button type="button" onclick="closeSocket();">대회방 나가기</button>
    <br/><br/><br/>
    메세지 입력 :
    <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
    <input type="text" id="messageinput">
    <button type="button" onclick="send();">메세지 전송</button>
    <button type="button" onclick="javascript:clearText();">대화내용 지우기</button>
</div>
<!-- Server responses get written here -->
<div id="messages">
</div>

<script type="text/javascript">
    var ws;
    var messages = document.getElementById("messages");

    function openSocket() {
        if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
            writeResponse("WebSocket is already opened.");
            return;
        }
        //웹소켓 객체 만드는 코드
        ws = new WebSocket("ws://localhost:8080/echo.do");

        ws.onopen = function (event) {
            if (event.data === undefined) {
                return;
            }
            writeResponse(event.data);
        };

        ws.onmessage = function (event) {
            console.log('writeResponse');
            console.log(event.data)
            writeResponse(event.data);
        };

        ws.onclose = function (event) {
            writeResponse("대화 종료");
        }

    }

    function send() {
        var text = document.getElementById("messageinput").value + "," + document.getElementById("sender").value;
        ws.send(text);
        text = "";
    }

    function closeSocket() {
        ws.close();
    }

    function writeResponse(text) {
        messages.innerHTML += "<br/>" + text;
    }

    function clearText() {
        console.log(messages.parentNode);
        messages.parentNode.removeChild(messages)
    }

</script>
</body>
</html>


