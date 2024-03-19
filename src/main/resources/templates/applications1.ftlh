<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<style>
        .panel-table .panel-body {
            padding: 0;
        }

        .panel-table .panel-body .table-bordered {
            border-style: none;
            margin: 0;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
            text-align: center;
            width: 100px;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
        .panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
            border-right: 0px;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
        .panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
            border-left: 0px;
        }

        .panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td {
            border-bottom: 0px;
        }

        .panel-table .panel-body .table-bordered > thead > tr:first-of-type > th {
            border-top: 0px;
        }

        .panel-table .panel-footer .pagination {
            margin: 0;
        }

        /*
        used to vertically center elements, may need modification if you're not using default sizes.
        */
        .panel-table .panel-footer .col {
            line-height: 34px;
            height: 34px;
        }

        .panel-table .panel-heading .col h3 {
            line-height: 30px;
            height: 30px;
        }

        .panel-table .panel-body .table-bordered > tbody > tr > td {
            line-height: 34px;
        }


    </style>
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
    <div class="container h-100">
        <div class="row justify-content-md-center">
            <div class="card">
                <h1>Существующие заявки</h1>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col"><a href="/page/${currentPage}/title/${sortDir}">Наименование заявки</a></th>
                        <th scope="col"><a href="/page/${currentPage}/post/${sortDir}">Наименование должности</a></th>
                        <th scope="col"><a href="/page/${currentPage}/wage/${sortDir}">Заработная плата</a></th>
                        <th scope="col">Подробная информация</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list listApplications as application>
                    <tr>
                        <th scope="row">${application.title}</th>
                        <td>${application.post}</td>
                        <td>${application.wage}</td>
                        <td><a href="/application/${application.id}">Подробнее...</a></td>
                    </tr>
                    <#else>
                        <h3>Заявок нет !</h3>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
        <hr>
        <nav aria-label="Пагинация">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="/page/${currentPage}/${sortField}/${sortDir}">${currentPage}</a>
                </li>
                <#if ((currentPage - 1) != 0)>
                    <li class="page-item">
                        <a class="page-link" href="/page/${currentPage - 1}/${sortField}/${sortDir}">Предыдущая страница</a>
                    </li>
                </#if>
                <#if (currentPage != totalPages)>
                    <li class="page-item">
                        <a class="page-link" href="/page/${currentPage + 1}/${sortField}/${sortDir}">Следующая страница</a>
                    </li>
                </#if>
            </ul>
        </nav>
        Всего заявок: [${totalItems}]
<hr>
</body>
</html>