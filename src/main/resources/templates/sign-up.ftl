<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>회원 가입</title>
</head>
<body>
<#assign actionURL="/sign/create">
<form method="POST" action="${actionURL}">
    <table>
        <tr>
            <td>NAME</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Your ID</td>
            <td><input type="text" name="userId"></td>
        </tr>
        <tr>
            <td>Your PASSWORD</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="SIGN-UP!!"></td>
        </tr>
    </table>

</form>
</body>
</html>