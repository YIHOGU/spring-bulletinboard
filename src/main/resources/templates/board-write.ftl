<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>입력</title>
    <#include "css/board_basic.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
        button {
            margin: 5px;
        }
        .container-fluid {
            margin-top: 40px;
        }

        form {
            margin: 20px;
        }
        .funcButton{
            display: inline-block;
        }
        #deleteButton{
            float: right;
        }
        label{
            font-size: large;
        }
    </style>

</head>
<body>
<div class="navigation-wrapper">
    <div class="navigation-button">
        <i class="fa fa-bars"></i>
    </div>
    <div class="navigation-menu">
        <ul>
            <li><a href="">게시판1</a></li>
            <li><a href="">게시판2</a></li>
            <li><a href="">게시판3</a></li>

        </ul>
    </div>
</div>
<div class="container-fluid">
    <#if type == 'CREATE'>
        <form action="/board/back">
            <button class="btn btn-info">돌아가기</button>
        </form>
        <form method="POST" action="/write">
            <div class="form-group">
                <label for="titleInput1">글 제목</label>
                <input type="text" name="title" class="form-control" id="titleInput1">
                <label for="contentInput1">내용</label>
                <textarea rows="4" cols="50" class="form-control" name="content" id="contentInput1"></textarea>
            </div>
            <button type="submit" class="btn btn-success">글쓰기</button>
        </form>
    <#else>
        <form action="/board/back" class="funcButton">
            <button class="btn btn-info">돌아가기</button>
        </form>
        <form method="post" action="/delete?board_id=${board.boardId}" class="funcButton" id="deleteButton">
            <button class="btn btn-danger">삭제하기</button>
        </form>

        <form method="post" action="/update">
            <div class="form-group">
                <label for="titleInput2">글 제목<input type="hidden" name="boardId" value="${board.boardId}"></label>
                <input type="text" name="title" class="form-control" id="titleInput2" value="${board.title}">
            </div>
            <div class="form-group">
                <label for="contentInput2">내용</label>
                <textarea rows="4" cols="50" class="form-control" name="content"
                          id="contentInput2">${board.content}</textarea>
            </div>
            <button type="submit" class="btn btn-warning">수정하기</button>
        </form>
    </#if>
</div>
<script>
    var navButton = document.querySelector('.navigation-button');
    var navMenu = document.querySelector('.navigation-menu');
    var win = window;

    function openMenu(event) {

        navButton.classList.toggle('active');
        navMenu.classList.toggle('active');

        event.preventDefault();
        event.stopImmediatePropagation();
    }

    function closeMenu(event) {
        if (navButton.classList.contains('active')) {
            navButton.classList.remove('active');
            navMenu.classList.remove('active');
        }
    }

    navButton.addEventListener('click', openMenu, false);

    win.addEventListener('click', closeMenu, false);
</script>
</body>
</html>