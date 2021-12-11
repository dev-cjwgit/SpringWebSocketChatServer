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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인 정보</title>
</head>


<button type="button" onclick="openSocket();">대화방 참여</button>
<button type="button" onclick="closeSocket();">대회방 나가기</button>
<hr>

<style type="text/css">
    * {
        font-family: 나눔고딕;
    }

    #messageWindow {
        background: black;
        color: greenyellow;
    }

    #inputMessage {
        width: 500px;
        height: 20px
    }

    #btn-submit {
        background: white;
        background: #F7E600;
        width: 60px;
        height: 30px;
        color: #607080;
        border: none;
    }

    #main-container {
        width: 600px;
        height: 680px;
        border: 1px solid black;
        margin: 10px;
        display: inline-block;

    }

    #chat-container {
        vertical-align: bottom;
        border: 1px solid black;
        margin: 10px;
        min-height: 600px;
        max-height: 600px;
        overflow: scroll;
        overflow-x: hidden;
        background: #9bbbd4;
    }

    .chat {
        font-size: 20px;
        color: black;
        margin: 5px;
        min-height: 20px;
        padding: 5px;
        min-width: 50px;
        text-align: left;
        height: auto;
        word-break: break-all;
        background: #ffffff;
        width: auto;
        display: inline-block;
        border-radius: 10px 10px 10px 10px;
    }

    .notice {
        color: #607080;
        font-weight: bold;
        border: none;
        text-align: center;
        background-color: #9bbbd4;
        display: block;
    }

    .my-chat {
        text-align: right;
        background: #F7E600;
        border-radius: 10px 10px 10px 10px;
    }

    #bottom-container {
        margin: 10px;
    }

    .chat-info {
        color: #556677;
        font-size: 10px;
        text-align: right;
        padding: 5px;
        padding-top: 0px;

    }

    .chat-box {
        text-align: left;
    }

    .my-chat-box {
        text-align: right;
    }


</style>

<body style="top:50px;">
<div id="main-container">
    <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
    <div id="chat-container">

    </div>
    <div id="bottom-container">
        <input id="inputMessage" type="text">
        <input id="btn-submit" type="button" onclick="send()" value="전송">
    </div>
</div>
</body>

<!-- websocket javascript -->
<script type="text/javascript">
    var ws;
    var textarea = document.getElementById("messageWindow");
    var inputMessage = document.getElementById('inputMessage');

    function openSocket() {
        if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
            return;
        }
        //웹소켓 객체 만드는 코드
        ws = new WebSocket("ws://211.195.149.103:8080/echo.do");
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
        var chatMsg = inputMessage.value + "," + document.getElementById("sender").value;
        ;
        if (chatMsg == '') {
            return;
        }
        var date = new Date();
        var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + chatMsg + "</div><div class='chat-info'>" + dateInfo + "</div></div>");
        $('#chat-container').append($chat);
        inputMessage.value = "";
        ws.send(chatMsg);
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);

    }

    function closeSocket() {
        ws.close();
    }

    function writeResponse(text) {
        var chatMsg = text;
        var date = new Date();
        var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        if (chatMsg.substring(0, 6) == 'server') {
            var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
            $('#chat-container').append($chat);
        } else {
            var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box'>" + dateInfo + "</div></div>");
            $('#chat-container').append($chat);
        }
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);
    }

    function clearTextarea() {
        $('div.input-div textarea').val('');
    }

    window.onload = openSocket();
</script>

<script type="text/javascript">
    $(function () {
        $('#inputMessage').keydown(function (key) {
            if (key.keyCode == 13) {
                $('#inputMessage').focus();
                send();
            }
        });
        $('#btn-submit').click(function () {
            send();
        });

    })
</script>


</html>


