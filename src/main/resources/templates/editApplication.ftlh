<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Обновление данных</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/shards.min.css">
</head>
<body style="margin-left:10%; margin-right:10%">
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a href="/">
            <span class="navbar-brand mb-0 h1">Компания: Профессиональный подбор</span>
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
<div class="container my-5">
    <h2 class="mb-5">Визирование заявки</h2>
    <h5>Проверьте данные и примите решение:</h5>
    <form action="/update/${application.id}" method="post" enctype="multipart/form-data" object="${application}">
<hr>
<div class="form-group">
    <label for="title1">Наименование заявки</label>
    <div class="input-group mb-3">
        <input readonly placeholder="Пример: заявка_№N" type="text" required class="form-control" id="title1" name="title"
               value="${application.title}">
    </div>
</div>
<div class="form-group">
    <label for="post">Наименование вакансии</label>
    <div class="input-group mb-3">
        <input readonly placeholder="Пример: формовщик" type="text" required class="form-control" id="post" name="post"
               value="${application.post}">
    </div>
</div>
<div class="form-group">
    <label for="number_people">Количество людей</label>
    <div class="input-group mb-3">
        <input readonly placeholder="Пример: 5" type="number" required class="form-control" id="number_people" name="number_people"
               value="${application.number_people}">
    </div>
</div>
<div class="form-group">
    <label for="requirements1">Требования</label>
    <input readonly type="text" required class="form-control" id="requirements1" name="requirements" value="${application.requirements}">
</div>
        <div class="form-group">
            <label for="wage">Заработная плата</label>
            <div class="input-group mb-3">
                <input placeholder="${application.wage}" type="number" class="form-control" id="wage" name="wage"
                       value="${application.wage}">
                    <div class="input-group-append">
                        <span class="input-group-text">₽</span>
                    </div>
            </div>
        </div>

<div class="form-group">
    <label for="schedule2">График</label>
    <input readonly type="text" required class="form-control" id="schedule2" name="schedule"
           value="${application.schedule}">
</div>
<div class="form-group">
    <label for="date_of_completion">Дата заключения</label>
    <div class="input-group mb-3">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <input class="form-control" type="date" id="date_of_completion" name="date_of_completion">
        <script>
                    $('#date_of_completion').val(new Date().toJSON().slice(0,10));
                </script>
    </div>
</div>
<div class="form-group">
    <label for="result_visirovanya">Результат визирования</label>
    <select id="result_visirovanya" required name="result_visirovanya" class="form-control">
        <option value="application.result_visirovanya">Выберите состояние заявки:</option>

        <option value="Визирована!">Визировать!</option>
        <option value="Не визирована!">Не визировать!</option>
    </select>
</div>
<input type="hidden" name="_csrf" value="${_csrf.token}"/>

<button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
</form>
</div>
</body>
</html>