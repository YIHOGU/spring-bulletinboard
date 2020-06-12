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
        <th id="boardid">number</th>
        <td id="boardid2">${board.boardId}</td>
        <!--작성자가 NULL이면 에러나서 임시 조치 - session 처리시 삭제 -->
        <th id="writer">writer</th>
        <td id="writer2">${board.name?default("-NO_NAME-")}</td>
        <th id="date">date</th>
        <td id="date2">${board.wrote_at}</td>
    </tr>

    <tr>
        <th id="title">title</th>
        <td colspan="5" id="title2">${board.title}</td>
    </tr>

    <tr>
        <th id="content">content</th>
        <td colspan="5" id="content2">${board.content}</td>
    </tr>
</table>

<form action="/board/back">
    <button>back</button>
</form>
</body>
</html>