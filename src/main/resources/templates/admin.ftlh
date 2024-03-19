<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"
    <meta charset="UTF-8">
    <title>Отдел подбора</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"
</head>
<body style="margin-left:10%; margin-right:10%">
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a style="text-decoration: none" href="/">
            <span class="navbar-brand mb-0 h1">Профессиональный подбор</span>
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
<h4>Панель администратора</h4>
<table class="table">
    <thead class="thead-light">
    <tr>
        <th scope="col">Email</th>
        <th scope="col">Номер телефона</th>
        <th scope="col">Активность</th>
        <th scope="col">Роли</th>
        <th scope="col">Блокировка</th>
        <th scope="col">Редактирование</th>
    </tr>
    </thead>
    <#list users as user>
    <tr>
        <th>${user.email}</th>
        <th>${user.numberPhone}</th>
        <th><#if user.active>true<#else>false</#if></th>
        <th><#list user.roles as role>${role}</#list></th>
        <th>
            <form action="/admin/user/ban/${user.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Блокировка">
            </form>
        </th>
        <th><a href="/admin/user/edit/${user.id}">Назначить роль</a></th>
    </tr>
    <#else>
    <h3>Пользователей нет</h3>
</#list>
</table>
<hr>
<h1>Добавление новостей на сайт:</h1>
<div>
    <form action="/new/create" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">Заголовок</label>
            <input type="text" required class="form-control"
                   id="title" name="title">
        </div>
        <div class="form-group">
            <label for="text">Описание</label>
            <textarea required class="form-control" id="text" name="text"></textarea>
        </div>
        <div class="form-group">
            <label for="name_author">Автор</label>
            <div class="input-group mb-3">
                <input type="text" required class="form-control" id="name_author" name="name_author">
            </div>
        </div>
        <div class="form-group">
            <label for="rating">Рейтинг</label>
            <div class="input-group mb-3">
                <input type="number" required class="form-control" id="rating" name="rating">
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit" style="width: 100%" class="btn btn-dark">Добавить новую новость</button>
    </form>
</div>
<br>
<br>
</body>
</html>


