<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Отдел подбора</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script language="JavaScript">
        window.onbeforeunload = function () {
            localStorage.setItem('comment-save', document.getElementById('textarea').value);
        }
        window.onload = function () {
            document.getElementById('textarea').value = localStorage.getItem('comment-save');
        }
        function AddInfo() {
            document.getElementById('textarea').value = document.getElementById('buttonInfo').value.replace(/.+[\\\/]/, "");
        };
    </script>
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
    <#list resumes as resume>
    <div class="list-group">
        <p><b>${resume.id}</b> ${resume.fio} | <a href="/resume/${resume.id}">Подробнее...</a></p>
    </div>
    <#else>
    <h3>Нет входящих резюме !</h3>
    </#list>
</#if>
    <hr>
<#if user.isApplicant()>
    <h4>Ваше резюме:</h4>
    <#list resumes as resume>
    <div class="list-group">
            <#if user.id == resume.user_id.id>
            </b>ФИО пользователя:
                ${resume.fio} | <a href="/resume/${resume.id}">Подробнее...</a></p>
            </#if>
    </div>
    <#else>
    <h3>Нет резюме!</h3>
    </#list>
<h2>Заполните своё резюме</h2><hr>
<form action="/resume/create" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="Fio">ФИО</label>
        <input type="text" required class="form-control"
               id="Fio" name="Fio">
    </div>
    <div class="form-group">
        <label for="Education">Образование</label>
        <input type="text" required class="form-control"
               id="Education" name="Education">
    </div>
    <div class="form-group">
        <label for="Experience">Опыт работы</label>
        <textarea required class="form-control" id="Experience" name="Experience"></textarea>
    </div>
    <div class="form-group">
        <label for="Skills">Навыки</label>
        <div class="input-group mb-3">
            <textarea required class="form-control" id="Skills" name="Skills"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="ExpectedSalary">Ожидаемая заработная плата</label>
        <div class="input-group mb-3">
            <input type="number" required class="form-control" id="ExpectedSalary" name="ExpectedSalary">
            <div class="input-group-append">
                <span class="input-group-text">₽</span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="User_id">Введите личный идентификатор (его можно узнать в ЛК)</label>
        <div class="input-group mb-3">
            <input type="number" class="form-control" id="User_id" name="User_id" value="${resume.User_id}">
        </div>
    </div>
    <div class="form-group">
        <label for="profile_id">Введите идентификатор желаемой вакансии (его можно в детальном просмотре вакансии)</label>
        <div class="input-group mb-3">
            <input type="number" class="form-control" id="profile_id" name="profile_id">
        </div>
    </div>

    <input type="hidden" name="_csrf" value="${_csrf.token}"/>

    <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
</form>
<hr>
</#if>
<br>
<a href="/positionProfile">Вернуться назад</a>
</body>
</html>