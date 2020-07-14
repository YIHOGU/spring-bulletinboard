<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>회원 가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 40px;
        }

        form {
            width: 50%;
        }
        .input-group{
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<#assign actionURL="/sign/create">
<div class="container">
    <form method="POST" action="${actionURL}">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text" id="">내 이름은</span>
            </div>
            <input type="text" class="form-control" placeholder="홍">
            <input type="text" class="form-control" placeholder="길동">
            <div class="input-group-append">
                <span class="input-group-text" id="">입니다!</span>
            </div>
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text" id="">아이디는</span>
            </div>
            <input type="text" class="form-control" placeholder="hellWorld">
            <div class="input-group-append">
                <span class="input-group-text" id="">로 할게요!</span>
            </div>
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text" id="">비밀번호는</span>
            </div>
            <input type="password" class="form-control">
            <div class="input-group-append">
                <span class="input-group-text" id="">쉿~ 비밀이에요.</span>
            </div>
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text" id="">이메일은</span>
            </div>
            <input type="text" class="form-control" placeholder="abcd@efg.co.kr">
            <div class="input-group-append">
                <span class="input-group-text" id="">입니다~</span>
            </div>
        </div>
        <button class="btn btn-success">가입하기</button>
    </form>
    <form action="/board/back" class="funcButton">
        <button class="btn btn-info">돌아가기</button>
    </form>
</div>

</body>
</html>