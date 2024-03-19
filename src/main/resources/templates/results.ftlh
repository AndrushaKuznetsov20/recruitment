<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Результаты</title>
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
<#if user.isRecruter()>
<hr>
<#list results as result>
<div class="list-group">
    <p><b>${result.user_id}</b> ${result.position_id} | <a href="/result/${result.id}">Подробнее...</a></p>
</div>
<#else>
<h3>Нет результатов !</h3>
</#list>
<h2>Подведите итоги:</h2><hr>
<form action="/result/create" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="user_id">Введите идентификатор соискателя</label>
        <input type="text" required class="form-control"
               id="user_id" name="user_id">
    </div>
    <div class="form-group">
        <label for="position_id">Введите идентификатор вакансии</label>
        <input type="text" required class="form-control"
               id="position_id" name="position_id">
    </div>
    <div class="form-group">
        <label for="description">Введите комментарий</label>
        <input type="text" required class="form-control"
               id="description" name="description">
    </div>
    <div class="form-group">
        <label for="address">Введите ссылку на собеседование Яндекс.Телемост</label>
        <div class="input-group mb-3">
            <input type="text" required class="form-control" id="address" name="address">
        </div>
    </div>
    <div class="form-group">
        <label for="result_itog">Результат</label>
        <select id="result_itog" required name="result_itog" class="form-control">
            <option value="">Обратная связь:</option>

            <option value="Ждём на собеседовании!">Направить на собеседование!</option>
            <option value="Вы успешно трудоустроены!">Вы успешно трудоустроены!</option>
            <option value="К сожалению, мы не можем Вас принять!">К сожалению, мы не можем Вас принять!</option>

        </select>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>

    <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
</form>
</#if>
<#if user.isApplicant()>
<hr>
<form action="/result" method="get">
    Поиск результата по своему ID: <input type="number" name="user_id"><br>
    <input class="btn btn-dark my-2 my-sm-0" type="submit" value="Поиск"/>
</form>
<#list results as result>
<#if user.id == result.user_id>
<div class="list-group">
    <p><b>Идентификатор пользователя:${result.user_id}</b> Идентификатор вакансии: ${result.position_id} | <a href="/result/${result.id}">Подробнее...</a></p>
</div>
</#if>
<#else>
<h3>Нет результатов !</h3>
</#list>
</#if>
</body>
</html>