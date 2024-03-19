<#import "blocks/template.ftlh" as t>
<@t.template user>
<h1 style="text-align: center">Личный кабинет</h1>
<hr>
<br>
<div style="text-align: center">
    <#if user.isRecruter()>
        <img src="/static/images/avatar2.JPG"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
    </#if>
    <#if user.isAdmin()>
        <img src="/static/images/avatar3.jpg"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
    </#if>
    <#if user.isApplicant()>
        <img src="/static/images/avatar4.jpg"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
    </#if>
    <#if user.isDirector()>
        <img src="/static/images/avatar5.jpg"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
    </#if>
    <#if user.isDepartmentHead()>
        <img src="/static/images/avatar6.JPG"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
    </#if>
    <#if user.isUser()>
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
    </#if>
    <br>
    <h2>${user.name}</h2>
    <br>
    Электоронная почта: <b>${user.email}</b>
    <br>
    Номер телефона: <b>${user.numberPhone}</b>
    <br>
    <b>Личный идентификатор: ${user.id}</b>
    <br>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit" style="text-align: center; width: 50%" class="btn btn-dark mb-2">
        Выйти из аккаунта
    </button>
</form>
</div>
</@t.template>