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


<%--<button type="button" onclick="openSocket();">대화방 참여</button>--%>
<%--<button type="button" onclick="closeSocket();">대회방 나가기</button>--%>
<hr>
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }

    .chat_wrap .header {
        font-size: 14px;
        padding: 15px 0;
        background: #F18C7E;
        color: white;
        text-align: center;
    }

    .chat_wrap .chat {
        padding-bottom: 110px;
    }

    .chat_wrap .chat ul {
        width: 100%;
        list-style: none;
    }

    .chat_wrap .chat ul li {
        width: 100%;
    }

    .chat_wrap .chat ul li.left {
        text-align: left;
    }

    .chat_wrap .chat ul li.right {
        text-align: right;
    }

    .chat_wrap .chat ul li > div {
        font-size: 13px;
    }

    .chat_wrap .chat ul li > div.sender {
        margin: 10px 20px 0 20px;
        font-weight: bold;
    }

    .chat_wrap .chat ul li > div.message {
        display: inline-block;
        word-break: break-all;
        margin: 5px 20px;
        max-width: 75%;
        border: 1px solid #888;
        padding: 10px;
        border-radius: 5px;
        background-color: #FCFCFC;
        color: #555;
        text-align: left;
    }

    .chat_wrap .input-div {
        position: fixed;
        bottom: 0;
        width: 100%;
        background-color: #FFF;
        text-align: center;
        border-top: 1px solid #F18C7E;
    }

    .chat_wrap .input-div > textarea {
        width: 100%;
        height: 80px;
        border: none;
        padding: 10px;
    }

    .format {
        display: none;
    }

</style>

<body class="mainbody" style="top:50px;">

<div class="chat_wrap">
    <div class="header">
        CHAT
    </div>
    <div class="chat">
        <ul>
            <!-- 동적 생성 -->
        </ul>
    </div>
    <div class="input-div">
        <textarea placeholder="Press Enter for send message."></textarea>
    </div>

    <!-- format -->

    <div class="chat format">
        <ul>
            <li>
                <div class="sender">
                    <span></span>
                </div>
                <div class="message">
                    <span></span>
                </div>
            </li>
        </ul>
    </div>
</div>


</body>

<!-- websocket javascript -->
<script type="text/javascript">
    var ws;

    function init() {
        // enter 키 이벤트
        $(document).on('keydown', 'div.input-div textarea', function (e) {
            if (e.keyCode == 13 && !e.shiftKey) {
                e.preventDefault();
                const message = $(this).val();
                // 메시지 전송
                send(message);
                // 입력창 clear
                clearTextarea();
            }
        });

        openSocket();
    }

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

            writeResponse(event.data.split(',')[0], event.data.split(',')[1]);
        };

        ws.onclose = function (event) {
            writeResponse("대화 종료");
        }

    }

    function send(message) {
        ws.send("${userID}," + message);
    }

    function closeSocket() {
        ws.close();
    }

    function writeResponse(name, msg) {
        const LR = (name != "${userID}") ? "left" : "right";
        appendMessageTag(LR, name, msg);
    }

    function appendMessageTag(LR_className, name, msg) {
        const chatLi = createMessageTag(LR_className, name, msg);

        $('div.chat:not(.format) ul').append(chatLi);
        console.log("스크롤 : " + $("div.chat")[0].scrollHeight);
        // 스크롤바 아래 고정
        window.scroll(0, $("div.chat")[0].scrollHeight)
        // $("#mainbody").scrollTop($("div.chat")[0].scrollHeight);
    }

    // 메세지 태그 생성
    function createMessageTag(LR_className, name, msg) {
        // 형식 가져오기
        let chatLi = $('div.chat.format ul li').clone();

        // 값 채우기
        chatLi.addClass(LR_className);
        chatLi.find('.sender span').text(name);
        chatLi.find('.message span').text(msg);

        return chatLi;
    }

    function clearTextarea() {
        $('div.input-div textarea').val('');
    }

    window.onload = init();
</script>

<%--
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
--%>


</html>


