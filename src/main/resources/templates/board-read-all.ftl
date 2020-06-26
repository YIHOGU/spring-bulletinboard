<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>전체조회</title>
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
        <th id="boardid">글번호</th>
        <th id="title">제목</th>
        <th id="writer">작성자</th>
        <th id="date">날짜</th>
    </tr>

    <#list boardPaging.iterator() as row>
        <tr>
            <td>${row.boardId}</td>
            <td>
                <a href="http://localhost:8080/board/board-one?board_id=${row.boardId}">
                    ${row.title}
                </a>
            </td>
            <!--작성자가 NULL이면 에러나서 임시 조치 - session 처리시 삭제 -->
            <td>${row.user_id?default("-NO_NAME-")}</td>
            <td>${row.wrote_at}</td>
        </tr>
    </#list>
</table>

<!-- 나중에 로그인이 되어있어야만 글쓰게 하기-->
<#assign writeAction="/board/write?type=CREATE">

<form method="POST" action="${writeAction}">
    <button class="actionButton">글쓰기</button>
</form>

<#--페이지 버튼-->
<#if boardNext?then("true","false") == "true">
    <form method="POST" action="/board?page=${boardNextNum}" class="pagingbutton">
        <button>다음</button>
    </form>
</#if>

<#if boardPre?then("true","false") == "true">
<form method="POST" action="/board?page=${boardPreNum}" class="pagingbutton">
    <button>이전</button>
</form>
</#if>

<footer>${boardNextNum}</footer>
</body>
</html>