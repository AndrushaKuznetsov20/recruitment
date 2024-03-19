<#import "spring.ftl" as spring />

<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/static/css/style.css">
        <link rel="stylesheet" href="/static/images/fon.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">
        <title>Отдел по подбору персонала на производство</title>
        <script>
            document.getElementById('date_of_completion').value = new Date().toISOString().substring(0, 10);
        </script>
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

<!--<img src="/static/images/fon.png" width="1190" height="600"> -->
<main>
    <#if !user.email??>
        <img src="/static/images/fon.png" width="1190" height="600">
    <div>
        <h3>О НАС</h3>
        <p>Мы представляем компанию по подбору персонала на производство готовой продукции... Компания без любых трудностей поможет подобрать вам
        подходящую вакансию. </p>
    </div>
    </#if>
<hr>
    <b><a href="/new">Перейти в раздел "Новости"...</a></b>
<hr>
<#if !user.email??>
<div class="card-columns">
    <#list positionProfiles as positionProfile>
    <a href="/positionProfile/${positionProfile.id}" class="product-link">
        <div class="card text-white bg-dark my-3 product">
            <img src="/images/${positionProfile.previewImageId}"
                 class="card-img-top" width="280" height="200">
            <div class="card-body">
                <h5 class="card-title">${positionProfile.title}</h5>
                <p class="card-text">${positionProfile.wage} ₽</p>
            </div>
            <div class="card-footer">
                ${positionProfile.schedule}
            </div>
        </div>
    </a>
    <#else>
    <h1 style="text-align: center">Не найдено</h1>
</#list>
</#if>
<#if user.email??>
    <#if user.isRecruter()>
    <h2>Добро пожаловать! Вы зашли как рекрутер.</h2>
    <a href="/application">Перейти к просмотру заявок на подбор</a> |
    <a href="/resume">Перейти к просмотру входящих резюме</a> |
    <a href="/result">Дать обратную связь соискателю</a> |
    <a href="/treaty">Перейти к оформлению договора</a>
<hr>
    <h4>Создать новый профиль должности:</h4><hr>
    <div>
        <form action="/positionProfile/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Наименование вакансии</label>
                <input type="text" required maxlength="30" minlength="5" class="form-control"
                       id="title" name="title">
            </div>
            <div class="form-group">
                <label for="description">Описание</label>
                <textarea required class="form-control" maxlength="300" minlength="15" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <label for="wage">Заработная плата</label>
                <div class="input-group mb-3">
                    <input type="number" required min="10000" max="200000 "class="form-control" id="wage" name="wage">
                    <div class="input-group-append">
                        <span class="input-group-text">₽</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="schedule">График</label>
                <select id="schedule" required name="schedule" class="form-control">
                    <option value="">График не выбран</option>

                    <option value="1/3">График: 1/3</option>
                    <option value="2/2">График: 2/2</option>
                    <option value="2/4">График: 2/4</option>

                </select>
            </div>
            <div class="form-group">
                <label for="requirements">Требования</label>
                <textarea required maxlength="300" minlength="10" class="form-control" id="requirements" name="requirements"></textarea>
            </div>
            <div class="form-group">
                <label for="experience">Опыт работы</label>
                <textarea required maxlength="300" minlength="3" class="form-control" id="experience" name="experience"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография к товару</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография к товару</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография к товару</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark"
                    оnclick="myPositionProfile()">Добавить</button>
        </form>
    </div>
    <hr>
    <h3>Созданные профили:</h3>
    <div class="card-columns">
        <#list positionProfiles as positionProfile>
        <a href="/positionProfile/${positionProfile.id}" class="product-link">
            <div class="card text-white bg-dark my-3 product">
                <img src="/images/${positionProfile.previewImageId}"
                     class="card-img-top" width="280" height="200">
                <div class="card-body">
                    <h5 class="card-title">${positionProfile.title}</h5>
                    <p class="card-text">${positionProfile.wage} ₽</p>
                </div>
                <div class="card-footer">
                    ${positionProfile.schedule}
                </div>
                <div class="card-footer">
                    ${positionProfile.id}
                </div>
            </div>
        </a>
        <#else>
        <h1 style="text-align: center">Не найдено</h1>
    </#list>
    </#if>
</#if>
<hr>
<#if user.isAdmin()>
    <h3>Добро пожаловать ! Вы зашли как администратор.</h3>
    <a href="/admin">Перейти в панель администратора</a>
    <hr>
    <h3>Доступные вакансии:</h3>
    <div class="card-columns">
        <#list positionProfiles as positionProfile>
        <a href="/positionProfile/${positionProfile.id}" class="product-link">
            <div class="card text-white bg-dark my-3 product">
                <img src="/images/${positionProfile.previewImageId}"
                     class="card-img-top" width="280" height="200">
                <div class="card-body">
                    <h5 class="card-title">${positionProfile.title}</h5>
                    <p class="card-text">${positionProfile.wage} ₽</p>
                </div>
                <div class="card-footer">
                    ${positionProfile.schedule}
                </div>
            </div>
        </a>
        <#else>
        <h1 style="text-align: center">Не найдено</h1>
</#list>
</#if>
<#if user.isDepartmentHead()>
    <h3>Добро пожаловать ! Вы зашли как руководитель департамента.</h3>
    <hr>
        <a href="/application">Перейти к просмотру имеющихся заявок...</a>
    <hr>
    <h4>Добавить новую заявку</h4>
<div>
    <hr>
    <form action="/application/create" method="post" enctype="multipart/form-data" onsubmit="submitForm()">
            <#if listErrors>
                <h6>Список ошибок. Пожалуйста, ознакомьтесь с ними, исправьте значения и отправьте форму повторно!</h6>
                <#list listErrors as errors>
                    <div>
                        <ul>
                            <li><span style="color:red;">${errors.getDefaultMessage()}</span></li>
                        </ul>
                    </div>
                </#list>
            </#if>
            <hr>
            <div class="form-group">
                <label for="title">Наименование заявки</label>
                <div class="input-group mb-3">
                    <input placeholder="Пример: заявка_№N" type="text" required class="form-control" id="title1" name="title"
                           value="${application.title}">
                </div>
            </div>
        <div class="form-group">
            <label for="post">Наименование вакансии</label>
            <div class="input-group mb-3">
                <input placeholder="Пример: формовщик" type="text" required class="form-control" id="post" name="post"
                       value="${application.post}">
            </div>
        </div>
        <div class="form-group">
            <label for="number_people">Количество людей</label>
            <div class="input-group mb-3">
                <input placeholder="Пример: 5" type="number" required class="form-control" id="number_people" name="number_people"
                       value="${application.number_people}">
            </div>
        </div>
        <div class="form-group">
            <label for="requirements1">Требования</label>
            <input placeholder="Введите требования к соискателю" type="text" required class="form-control" id="requirements1" name="requirements"
                   value="${application.requirements}">
        </div>
        <div class="form-group">
            <label for="wage1">Заработная плата</label>
            <div class="input-group mb-3">
                <input placeholder="Пример: 15000" type="number" required class="form-control" id="wage1" name="wage" value="${application.wage}">
                <div class="input-group-append">
                    <span class="input-group-text">₽</span>
                </div>
            </div>
        </div>
    <script>
        document.addEventListener('DOMContentLoaded', function(){
            var item = localStorage.getItem('schedule1');
            var select = document.getElementById("schedule1");
            select.value = item;
    });
        function submitForm(){
            var select = document.getElementById("schedule1");
            var value = select.options[select.selectedIndex].value;
            localStorage.setItem('schedule1', value);
    }
    </script>
        <div class="form-group">
            <label for="schedule1">График</label>
            <select id="schedule1" required name="schedule" class="form-control">
                <option>График не выбран</option>
                <option value="1/3">График: 1/3</option>
                <option value="2/2">График: 2/2</option>
                <option value="2/4">График: 2/4</option>
            </select>
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

                    <option value="Отправлена на визирование!">Отправить на визирование!</option>
            </select>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
    </form>
</div>
<hr>
<br>
<br>
</#if>
<#if user.isDirector()>
<h3>Добро пожаловать ! Вы зашли как директор.</h3>
<hr>
<h4>Откройте список заявок для визирования</h4>
    <a href="/application">Список заявок...</a>
</#if>

<#if user.isApplicant()>
    <h3>Добро пожаловать ! Вы зашли как соискатель.</h3>
<hr>
<a href="/treaty">Перейти к списку договоров...</a> |
<a href="/result">Просмотр результатов:</a> |
<a href="/resume">Просмотр резюме:</a> |
<h3>Доступные вакансии:</h3>
<div class="card-columns">
    <#list positionProfiles as positionProfile>
    <a href="/positionProfile/${positionProfile.id}" class="product-link">
        <div class="card text-white bg-dark my-3 product">
            <img src="/images/${positionProfile.previewImageId}"
                 class="card-img-top" width="280" height="200">
            <div class="card-body">
                <h5 class="card-title">${positionProfile.title}</h5>
                <p class="card-text">${positionProfile.wage} ₽</p>
            </div>
            <div class="card-footer">
                ${positionProfile.schedule}
            </div>
        </div>
    </a>
    <#else>
    <h1 style="text-align: center">Не найдено</h1>
</#list>
</#if>
</main>
<hr>
<footer>
    <div>
        <h6>Контакты компании:</h6>
        <p>Номер телефона: +7(900)-909-90-90<br>
        Email: andrusha02.2002@mail.ru</p>
    </div>
</footer>
</body>
</html>