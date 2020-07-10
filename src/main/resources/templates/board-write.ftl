<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>입력</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <#if type == 'CREATE'>
        <form method="POST" action="/write">
            <table>
                <tr>
                    <td>제목</td>
                    <td colspan="2">
                        <input type="text" name="title">
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="2">
                        <textarea rows="4" cols="50" name="content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <button type="submit" class="btn btn-success">글쓰기</button>
                    </td>
                </tr>
            </table>
        </form>
    <#else>
        <table>
            <form method="post" action="/update">
                <tr>
                    <td>제목<input type="hidden" name="boardId" value="${board.boardId}"</td>
                    <td colspan="2">
                        <input type="text" name="title" value="${board.title}">
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="2">
                        <textarea rows="4" cols="50" name="content">${board.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" class="btn btn-warning">수정하기</button>
                    </td>
            </form>
            <td>
                <form method="post" action="/delete?board_id=${board.boardId}">
                    <button class="btn btn-danger">삭제하기</button>
                </form>
            </td>
            <td>
                <form action="/board/back">
                    <button class="btn btn-info">뒤로가기</button>
                </form>
            </td>

            </tr>
        </table>

    </#if>
</div>

</body>
</html>