<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>입력</title>
</head>
<body>
<#assign actionURL="/board/write">
<form method="POST" action="${actionURL}">
    <table>
        <tr>
            <td>TITLE</td>
            <td><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>content</td>
            <td><textarea rows="4" cols="50" name="content"></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="WRITE!!"></td>
        </tr>
    </table>

</form>

</body>
</html>