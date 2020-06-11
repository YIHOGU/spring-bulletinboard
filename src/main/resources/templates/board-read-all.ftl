<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>단건조회</title>
    <#include "css/board_basic.css">
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
        <th id="boardid">BOARDID</th>
        <th id="title">TITLE</th>
        <th id="writer">WRITER</th>
        <th id="date">DATE</th>
    </tr>


    <#list boardList as row>
    <tr>
        <td>${row.boardId} ~~~ ${row_index}</td>
        <td>
            <a href="http://localhost:8080/board/board-one?board_id=${row.boardId}">${row.title}</a>
        </td>
        <!--작성자가 NULL이면 에러나서 임시 조치 - session 처리시 삭제 -->
                <td>${row.name?default("-NO_NAME-")}</td>
                <td>${row.wrote_at}</td>
            </tr>
        </#list>

</table>

<!-- 나중에 로그인이 되어있어야만 글쓰게 하기-->
        <#assign writeAction="/board/goToWrite">
        <#assign pagingbefore="/board/before">
        <#assign pagingnext="/board/next">
        <form method="POST" action="${writeAction}">
            <button>write</button>
        </form>
        <form method="POST" action="${pagingnext}" class="paging_button">
            <button>next</button>
        </form>
        <form method="POST" action="${pagingbefore}" class="paging_button">
            <button>before</button>
        </form>
        <footer>한글테스트</footer>
</body>
</html>