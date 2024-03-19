<#macro showErrors separator classOrStyle="">
    <#list status.errorMessages as error>
        <#if classOrStyle == "">
            <b>${error}</b>
        <#else>
            <#if classOrStyle?index_of(":") == -1><#assign attr="class"><#else><#assign attr="style"></#if>
                <span ${attr}="${classOrStyle}">${error}</span>
            </#if>
        <#if error_has_next>${separator}</#if>
    </#list>
</#macro>

<#macro formInput id name label type="text" value="" class="form-control">
<label for="${id}">${label}</label>
<input class="form-control" type="${type}" id="${id}" name="${name}" value="${value}">
</#macro>
