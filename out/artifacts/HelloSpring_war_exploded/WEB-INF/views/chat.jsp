<html>
<%-- copyright https://dororongju.tistory.com/151 --%>
<head>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${roomId} 에 오신것을 환영합니다.</title>
</head>


<body style="top:50px;" class="mainbody">
<hr>


<%--<button type="button" onclick="openSocket();">대화방 참여</button>--%>
<%--<button type="button" onclick="closeSocket();">대회방 나가기</button>--%>
<button type="button" onclick="clearChat();">채팅 청소하기</button>
<div class="chat_wrap">
    <div class="header">
        ${roomId} 에 오신것을 환영합니다.
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

    <div class="chat-format">
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

    <div class="server-format">
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
        } else if (json.email === "${userEmail}") {
            LR = "right"
        } else {
            LR = "left"
        }
        appendMessageTag(LR, json.name, json.msg);
    }

    function appendMessageTag(LR_className, name, msg) {
        const chatLi = createMessageTag(LR_className, name, msg);
        $('div.chat ul').append(chatLi);

        // 스크롤바 아래 고정
        window.scroll(0, $("div.chat")[0].scrollHeight)
        // $("#mainbody").scrollTop($("div.chat")[0].scrollHeight);
    }

    // 메세지 태그 생성
    function createMessageTag(LR_className, name, msg) {
        // 형식 가져오기
        let chatLi
        if (LR_className !== "server") {
            chatLi = $('div.chat-format ul li').clone();
            // 값 채우기
            chatLi.addClass(LR_className);
            chatLi.find('.sender span').text(name);
            chatLi.find('.message span').text(msg);
        } else {
            chatLi = $('div.server-format ul li').clone();
            // chatLi.children().removeClass("message");
            // 값 채우기
            chatLi.addClass("server");
            chatLi.find('span').text(msg);

        }
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

    .chat_wrap .chat .server {
        border: none;
        text-align: center;
        background-color: grey;
        color: white;
        font-size: 13px;
        line-height: 200%;
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
</style>

</body><!-- websocket javascript -->

</html>