<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>입력</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
        button{
            margin: 5px;
        }
        .container-fluid{
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <form method="post" action="/update/reply">
        <table>
            <tr>
                <td>내용</td>
                <td colspan="2">
                    <textarea rows="4" cols="50" name="replyContent">${reply.replyContent}</textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="hidden" name="boardId" value="${board_id}">
                    <input type="hidden" name="replyId" value="${reply.replyId}">
                    <button type="submit" class="btn btn-warning">수정하기</button>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>