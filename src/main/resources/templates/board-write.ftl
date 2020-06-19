<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>입력</title>
</head>
<body>
<#if type == 'CREATE'>
    <form method="POST" action="/write">
        <table>
            <caption>글쓰기</caption>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea rows="4" cols="50" name="content"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="글쓰기"></td>
            </tr>
        </table>
    </form>
    <#else>
        <form method="post" action="/update?board_id=${board.boardId}">
            <table>
                <caption>수정하기</caption>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="${board.title}"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea rows="4" cols="50" name="content">${board.content}</textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="수정하기"></td>
                </tr>
            </table>
        </form>
    <form method="post" action="/delete?board_id=${board.boardId}">
        <button>삭제하기</button>
    </form>
</#if>

<form action="/board/back">
    <button>back</button>
</form>

</body>
</html>