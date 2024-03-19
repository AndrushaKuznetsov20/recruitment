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
<main>
<br>
<body style="margin-left:10%; margin-right:10%">
<h3>Раздел актуальных новостей:</h3>
<hr>
<#list news as new>
    <div class="card">
        <div class="card-header">
            ${new.name_author}
        </div>
        <div class="card-body">
            <h5 class="card-title">${new.title}</h5>
            <p class="card-text">${new.text}</p>
            <p class="card-text">Рейтинг: ${new.rating}</p>
            <#if user.isAdmin()>
            <form action="/new/delete/${new.id}" method="get">
                <input class="btn btn-dark my-2 my-sm-0" type="submit" value="Удалить новость"/>
            </form>
            </#if>
        </div>
        <hr>
    </div>
</#list>
</main>
<footer>
    <div>
        <h6>Контакты компании:</h6>
        <p>Номер телефона: +7(900)-909-90-90<br>
            Email: andrusha02.2002@mail.ru</p>
    </div>
</footer>
</body>
</html>