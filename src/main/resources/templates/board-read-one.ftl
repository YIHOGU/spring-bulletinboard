<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>단건조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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

<div class="container">
    <table border="1">
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

                    <input type="hidden" name="board" value="${board.boardId}">
                    <input type="text" name="replyContent">
                </td>
                <td>
                    <button class="btn btn-success">댓글 입력</button>
                </td>
            </tr>
        </form>
        <tr>
            <th id="reply" colspan="6">댓글</th>
        </tr>
        <#list board.replies as row>
            <tr>
                <td>${row.user_id?default("-NO_NAME-")}</td>
                <td colspan="4">${row.replyContent?default("-NO-CONTENT-")}</td>
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
        <button class="btn btn-info">뒤로</button>
    </form>
    <#assign updateAction="/board/write?type=UPDATE&board_id=${board.boardId}">
    <form method="POST" action="${updateAction}" class="actionButton">
        <button class="btn btn-warning">수정 및 삭제</button>
    </form>
</div>
</body>
</html>