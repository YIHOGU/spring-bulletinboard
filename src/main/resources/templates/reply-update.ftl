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
        form{
            margin: 20px;
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