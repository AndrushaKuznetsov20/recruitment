<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Подбор персонала</title>
    <link rel="stylesheet" href="/static/css/style.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
</head>
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
<br>
<body style="margin-left:10%; margin-right:10%">
<#list images as img>
<img src="/images/${img.id}" width="250px" height="200px"/>
</#list>
<h4>Подробная информация о вакансии:</h4>
    <b>Идентификатор вакансии: ${positionProfile.id}</b><br>
    <b>Наименование должности: </b> ${positionProfile.title}<br>
    <b>Описание: </b> ${positionProfile.description}<br>
    <b>Заработная плата: </b> ${positionProfile.wage}<br>
    <b>График: </b> ${positionProfile.schedule}<br>
    <b>Требования: </b> ${positionProfile.requirements}<br>
    <b>Опыт: </b> ${positionProfile.experience}<br>
<hr>
<#if user.isRecruter()>
    <form action="/positionProfile/delete/${positionProfile.id}" method="get">
        <input class="btn btn-dark my-2 my-sm-0" type="submit" value="Удалить профиль"/>
    </form>
</#if>
<#if user.isApplicant()>
    <h4>Понравилась вакансия ? Отправьте нам своё резюме на рассмотрение !</h4>
    <a href="/resume">Перейдите по ссылке для того, чтобы заполнить резюме или найти своё резюме в общем списке...</a>
</#if>
</body>
</html>