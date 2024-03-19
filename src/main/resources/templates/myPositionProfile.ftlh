<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>Список профилей</h1><hr>

<div class="card-columns">
    <#list positionProfiles as positionProfile>
    <a href="/positionProfile/${positionProfile.id}" class="product-link">
        <div class="card text-white bg-dark my-3 product">
            <img src="/images/${positionProfile.previewImageId}"
                 class="card-img-top">
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
<hr>
</body>
</html>