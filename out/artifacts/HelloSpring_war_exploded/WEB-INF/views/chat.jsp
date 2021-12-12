<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<%-- copyright https://dororongju.tistory.com/151 --%>
<head>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/chat.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${roomId} 에 오신것을 환영합니다.</title>
</head>


<body>
<div class="chat_wrap">
    <div class="header">
        채팅방에 오신것을 환영합니다.
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

    <div class="chat-left-format">
        <ul>

            <li>
                <div class="sender">
                    <span></span>
                </div>

                <div class="message">
                    <span></span>
                </div>

                <div class="date">
                    <span></span>
                </div>
            </li>

        </ul>
    </div>

    <div class="chat-right-format">
        <ul>
            <li>
                <div class="sender">
                    <span></span>
                </div>
                <div class="date">
                    <span></span>
                </div>
                <div class="message">
                    <span></span>
                </div>
            </li>
        </ul>
    </div>

    <div class="server-message-format">
        <ul>
            <li>
                <div>
                    <span></span>
                </div>
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    var ws;
    var name = "익명";

    function init() {
        // enter 키 이벤트
        $(document).on('keydown', 'div.input-div textarea', function (e) {
            if (e.keyCode === 13 && !e.shiftKey) {
                e.preventDefault();
                const message = $(this).val();
                if (message === "") {
                    alert("메세지를 입력해주세요.");
                    return;
                }
                // 메시지 전송
                send("msg", "text", message);
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
            send("enter_user", "text", "connect");
        };

        ws.onmessage = function (event) {
            var parseData = JSON.parse(event.data);
            if (parseData.roomid === "${roomId}") {
                writeResponse(parseData);
            }
        };

        ws.onclose = function (event) {
            appendMessageTag("server", "", "서버와 연결이 끊겼습니다.");
        }
    }

    function send(cmd, type, message) {
        data = {
            "cmd": cmd,
            "type": type,
            "name": name,
            "roomid": "${roomId}",
            "email": "${userEmail}",
            "msg": message
        };
        ws.send(JSON.stringify(data));
    }

    function closeSocket() {
        ws.close();
    }

    function writeResponse(json) {
        var LR;
        if (json.cmd === "enter_user" || json.cmd === "exit_user") {
            LR = "server";
            if (json.email === "${userEmail}") {
                name = json.name;
            }
        }
        appendMessageTag(json);
    }

    function appendMessageTag(json) {
        const chatLi = createMessageTag(json);
        $('div.chat ul').append(chatLi);

        window.scroll(0, $("div.chat")[0].scrollHeight)
    }


    // 메세지 태그 생성
    function createMessageTag(json) {
        // 형식 가져오기
        let chatLi
        if (json.cmd === "enter_user" || json.cmd === "exit_user") {
            chatLi = createServerMessageTag(json.msg)
        } else {
            if (json.email === "${userEmail}") {
                chatLi = createRightMessageTag(json.name, json.msg);
            } else {
                chatLi = createLeftMessageTag(json.name, json.msg);
            }
        }
        return chatLi;
    }

    function createLeftMessageTag(name, msg) {
        let chatLi;
        chatLi = $('div.chat-left-format ul li').clone();
        chatLi.addClass("left");
        chatLi.find('.sender span').text(name);
        chatLi.find('.message span').text(msg);
        let today = new Date();
        let hours = today.getHours(); // 시
        let minutes = today.getMinutes();  // 분
        let seconds = today.getSeconds();  // 초

        chatLi.find('.date span').text(hours + ":" + minutes + ":" + seconds);
        return chatLi;
    }

    function createRightMessageTag(name, msg) {
        let chatLi;
        chatLi = $('div.chat-right-format ul li').clone();
        chatLi.addClass("right");
        chatLi.find('.sender span').text(name);
        chatLi.find('.message span').text(msg);
        let today = new Date();
        let hours = today.getHours(); // 시
        let minutes = today.getMinutes();  // 분
        let seconds = today.getSeconds();  // 초

        chatLi.find('.date span').text(hours + ":" + minutes + ":" + seconds);
        return chatLi;
    }

    function createServerMessageTag(msg) {
        let chatLi;
        chatLi = $('div.server-message-format ul li').clone();
        chatLi.addClass("server");
        chatLi.find('span').text(msg);

        return chatLi;
    }


    function clearTextarea() {
        $('div.input-div textarea').val('');
    }

    function clearChat() {
        $('div.chat ul').empty();
    }

    window.onload = init();
</script>

</body>

</html>