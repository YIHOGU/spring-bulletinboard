<#ftl encoding="utf-8"/>
<!DOCTYPE html>

<div class="navigation-wrapper">
    <div class="navigation-button">
        <i class="fa fa-bars"></i>
    </div>
    <div class="navigation-menu">
        <ul>
            <li><a href="/board">홈</a></li>
            <li><a href="">게시판1</a></li>
            <li><a href="">게시판2</a></li>
            <li><a href="">게시판3</a></li>
        </ul>
    </div>
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