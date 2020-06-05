<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>단건조회</title>
    <#include "css/post_basic.css">
</head>
<body>
<table border="1">
    <caption>POST</caption>
    <tr>
        <th id="boardid">BOARDID</th>
        <td id="boardid2">${board.boardId}</td>
        <th id="writer">WRITER</th>
        <!--작성자가 NULL이면 에러나서 임시 조치 - session 처리시 삭제-->
        <td id="writer2">${board.name?default("-NO_NAME-")}</td>
        <th id="date">DATE</th>
        <td id="date2">${board.wrote_at}</td>
    </tr>
    <tr>
        <th id="title" colspan="1">TITLE</th>
        <td id="title2" colspan="5">${board.title}</td>
    </tr>
    <tr>
        <th id="content" colspan="1">CONTENT</th>
        <td id="content2" colspan="5">${board.content}</td>
    </tr>
</table>
<#assign actionURL="/board/back">
<form method="POST" action="${actionURL}"><button id="back">back</button></form>

</body>
</html>