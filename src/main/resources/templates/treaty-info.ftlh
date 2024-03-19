<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Подбор персонала</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body style="margin-left:10%; margin-right:10%">
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a style="text-decoration: none" href="/">

            <span class="navbar-brand mb-0 h1">Отдел подбора</span>
        </a>
        <#if user.email??>
        <div class="dropdown text-end">
            <#if user.isAdmin()>
            <a href="/profile">
                <img src="/static/images/avatar3.jpg" alt="mdo"
                     width="32" height="32" class="rounded-circle">
            </a>
        </#if>
        <#if user.isRecruter()>
        <a href="/profile">
            <img src="/static/images/avatar2.JPG" alt="mdo"
                 width="32" height="32" class="rounded-circle">
        </a>
    </#if>
    <#if user.isDirector()>
    <a href="/profile">
        <img src="/static/images/avatar5.jpg" alt="mdo"
             width="32" height="32" class="rounded-circle">
    </a>
</#if>
<#if user.isDepartmentHead()>
<a href="/profile">
    <img src="/static/images/avatar6.JPG" alt="mdo"
         width="32" height="32" class="rounded-circle">
</a>
</#if>
<#if user.isApplicant()>
<a href="/profile">
    <img src="/static/images/avatar4.jpg" alt="mdo"
         width="32" height="32" class="rounded-circle">
</a>
</#if>
<#if user.isUser()>
<a href="/profile">
    <img src="/static/images/avatar.png" alt="mdo"
         width="32" height="32" class="rounded-circle">
</a>
</#if>
</div>
<#else>
<button class="btn btn-light my-2 my-sm-0" type="button"
        onclick="window.location.href = '/login'">
    Войти
</button>
</#if>
</div>
</nav>
<hr>
<h3>Подробная информация о договоре</h3>
<b>Наименование должности: </b> ${treaty.name_post}<br>
<b>ФИО: </b> ${treaty.fio}<br>
<b>Статус договора: </b> ${treaty.statusTreaty}<br>
<b>Заработная плата: </b> ${treaty.wage}<br>
<b>Дата заключения: </b> ${treaty.date_of_conclusion}<br>
<hr>
<form action="/treaty/delete/${treaty.id}" method="get">
    <input class="btn btn-dark my-2 my-sm-0" type="submit" value="Удалить договор"/>
</form>
<br>
<a href="/treaty">Вернуться назад</a>
</body>
</html>