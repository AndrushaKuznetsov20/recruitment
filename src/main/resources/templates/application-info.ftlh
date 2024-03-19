<!DOCTYPE html>
<html>
    <head>
        <script language="JavaScript">
    window.onbeforeunload = function () {
        localStorage.setItem('save', document.getElementById('textareaInfo').value);
    }
    window.onload = function () {
        document.getElementById('textareaInfo').value = localStorage.getItem('save');
    }
    function AddInfoImages() {
        document.getElementById('textareaInfo').value = document.getElementById('buttonInfoImages').value.replace(/.+[\\\/]/, "");
    };
</script>
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
<h3>Подробная информация о заявке</h3>
    <b>Наименование заявки: </b> ${application.title}<br>
    <b>Наименование должности: </b> ${application.post}<br>
    <b>Количество людей: </b> ${application.number_people}<br>
    <b>Требования: </b> ${application.requirements}<br>
    <b>Заработная плата: </b> ${application.wage}<br>
    <b>График: </b> ${application.schedule}<br>
    <b>Дата создания заявки: </b> ${application.date_of_completion}<br>
    <b>Результат визирования: </b> ${application.result_visirovanya}<br>
    <#if user.isDirector()>
        <a href="/edit/${application.id}">Визировать заявку...</a>
    </#if>
<hr>
<br>
<form action="/application/delete/${application.id}" method="get">
    <input class="btn btn-dark my-2 my-sm-0" type="submit" value="Удалить заявку"/>
</form>
<br>
<a href="/application">Вернуться назад</a>
</body>
</html>