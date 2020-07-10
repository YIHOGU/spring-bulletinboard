<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>전체조회</title>
    <#--    <#include "css/board_basic.css">-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
        .container-fluid{
            margin: 30px 10px;
        }
        button{
            margin: 5px;
        }
        .thead-dark{
            text-align: center;
            font-size: x-large;
        }
        #paging-group{
            float: right;
        }
    </style>
</head>
<body>
<!--나중에 assign 써서 로그인 상태 확인 후 해당 버튼 등장하게 수정-->
<#assign signup="/sign/sign-up">
<#assign signin="/sign/sign-in">
<div class="btn-group" role="group">
    <form method="POST" action="${signup}">
        <button class="btn btn-primary">회원가입</button>
    </form>
    <form method="POST" action="${signin}">
        <button class="btn btn-primary">로그인</button>
    </form>
</div>

<div class="container-fluid">
    <table border="1" class="table">
        <thead class="thead-dark">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
        </tr>
        </thead>
        <tbody>
        <#list boardPaging.iterator() as row>
            <tr>
                <td>${row.boardId}</td>
                <td>
                    <a href="http://localhost:8080/board/board-one?board_id=${row.boardId}">
                        ${row.title}
                    </a>
                </td>
                <!--작성자가 NULL이면 에러나서 임시 조치 - session 처리시 삭제 -->
                <td>${row.user_id?default("GUEST USER")}</td>
                <td>${row.wrote_at}</td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>


<!-- 나중에 로그인이 되어있어야만 글쓰게 하기-->
<#assign writeAction="/board/write?type=CREATE">
<div class="btn-group" role="group">
    <form method="POST" action="${writeAction}">
        <button class="btn btn-success">글쓰기</button>
    </form>
</div>


<#--페이지 버튼-->
<div class="btn-group" role="group" id="paging-group">
    <#if boardPre?then("true","false") == "true">
        <form method="POST" action="/board?page=${boardPreNum}" class="pagingbutton">
            <button class="btn btn-info">이전</button>
        </form>
    </#if>
    <#if boardNext?then("true","false") == "true">
        <form method="POST" action="/board?page=${boardNextNum}" class="pagingbutton">
            <button class="btn btn-info">다음</button>
        </form>
    </#if>
</div>
</body>
</html>