<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>단건조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
        .table-dark{
            text-align: center;
            font-size: x-large;
        }
        button{
            margin: 5px;
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
        <tr>
            <th class="table-dark">글번호</th>
            <td >${board.boardId}</td>
            <!--작성자가 NULL이면 에러나서 임시 조치 - session 처리시 삭제 -->
            <th class="table-dark">작성자</th>
            <td>${board.name?default("GUEST USER")}</td>
            <th class="table-dark">날짜</th>
            <td>${board.wrote_at}</td>
        </tr>

        <tr>
            <th class="table-dark">제목</th>
            <td colspan="5">${board.title}</td>
        </tr>

        <tr>
            <th class="table-dark">내용</th>
            <td colspan="5">${board.content}</td>
        </tr>
        <form method="POST" action="/reply/write">
            <tr>
                <th class="table-dark">GUSET</th>
                <td colspan="4">

                    <input type="hidden" name="board" value="${board.boardId}">
                    <input type="text" name="replyContent" size="100">
                </td>
                <td>
                    <button class="btn btn-success">댓글 입력</button>
                </td>
            </tr>
        </form>
        <tr>
            <th class="table-dark" colspan="6">댓글</th>
        </tr>
        <#list board.replies as row>
            <tr>
                <th class="table-dark">${row.user_id?default("GUEST USER")}</th>
                <td colspan="3">${row.replyContent?default("-NO-CONTENT-")}</td>
                <td>
                    <form method="post" action="/updatereply?reply_id=${row.replyId}">
                        <button class="btn btn-warning">수정</button>
                    </form>
                </td>
                <td>
                    <form method="post" action="/delete/reply?reply_id=${row.replyId}">
                        <input type="hidden" name="boardId" value="${board.boardId}">
                        <button class="btn btn-danger">삭제</button>
                    </form>
                </td>
            </tr>
        </#list>

    </table>
</div>

<div class="btn-group" role="group">
    <form action="/board/back" class="actionButton">
        <button class="btn btn-info">목록</button>
    </form>
    <#assign updateAction="/board/write?type=UPDATE&board_id=${board.boardId}">
    <form method="POST" action="${updateAction}" class="actionButton">
        <button class="btn btn-warning">수정 및 삭제</button>
    </form>
</div>
</body>
</html>