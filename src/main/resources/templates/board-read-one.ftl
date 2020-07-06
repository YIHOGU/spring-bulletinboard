<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>단건조회</title>
    <#include "css/post_basic.css">
</head>
<body>
<!--나중에 assign 써서 로그인 상태 확인 후 해당 버튼 등장하게 수정-->
<#assign signup="/sign/sign-up">
<#assign signin="/sign/sign-in">
<form method="POST" action="${signup}">
    <button id="sign-up">sign-up</button>
</form>
<form method="POST" action="${signin}">
    <button id="sign-in">sign-in</button>
</form>
<table border="1">
    <caption>BOARD</caption>

    <tr>
        <th id="boardid">글번호</th>
        <td id="boardid2">${board.boardId}</td>
        <!--작성자가 NULL이면 에러나서 임시 조치 - session 처리시 삭제 -->
        <th id="writer">작성자</th>
        <td id="writer2">${board.name?default("-NO_NAME-")}</td>
        <th id="date">날짜</th>
        <td id="date2">${board.wrote_at}</td>
    </tr>

    <tr>
        <th id="title">제목</th>
        <td colspan="5" id="title22">${board.title}</td>
    </tr>

    <tr>
        <th id="content">내용</th>
        <td colspan="5" id="content2">${board.content}</td>
    </tr>
    <form method="POST" action="/reply/write">
        <tr>
            <td>세션 본인 아이디 - ${board.boardId}</td>
            <td colspan="4">

                <input type="hidden" name="boardId" value="${board.boardId}">
                <input type="text" name="replyContent">
            </td>
            <td>
                <button>댓글 입력</button>
            </td>
        </tr>
    </form>
    <tr>
        <th id="reply" colspan="6">댓글</th>
    </tr>
    <#list replyList as row>
        <tr>
            <td>${row.user_id?default("-NO_NAME-")}</td>
            <td colspan="4">${row.replyContent}?d</td>
            <td>
                <form>
                    <button>삭제</button>
                </form>
            </td>
        </tr>
    </#list>

</table>

<form action="/board/back" class="actionButton">
    <button>뒤로</button>
</form>
<#assign updateAction="/board/write?type=UPDATE&board_id=${board.boardId}">
<form method="POST" action="${updateAction}" class="actionButton">
    <button>수정 및 삭제</button>
</form>
</body>
</html>