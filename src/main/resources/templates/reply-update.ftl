<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>입력</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
        button {
            margin: 5px;
        }

        .container-fluid {
            margin-top: 40px;
        }
        form{
            margin: 20px;
        }
        label{
            font-size: large;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <form method="post" action="/update/reply">
        <input type="hidden" name="replyId" value="${reply.replyId}">
        <div class="form-group">
            <label for="replyInput">내용</label>
            <textarea rows="4" cols="50" class="form-control" name="replyContent"
                      id="replyInput">${reply.replyContent}</textarea>
        </div>
        <button type="submit" class="btn btn-warning">수정하기</button>
    </form>
</div>

</body>
</html>