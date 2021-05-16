<!DOCTYPE html>
<html lang="en-AU">
<head>
    <g:if test="${config == null}">
        <g:set var="config" value="${grailsApplication.config}"/>
    </g:if>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="app.version" content="${g.meta(name: 'app.version')}"/>
    <meta name="app.build" content="${g.meta(name: 'app.build')}"/>
    <meta name="description" content="${config.skin?.orgNameLong ?: 'Atlas of Living Australia'}"/>
    <meta name="author" content="${config.skin?.orgNameLong ?: 'Atlas of Living Australia'}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link href="${config.favicon.url}" rel="shortcut icon" type="image/x-icon"/>
    <title><g:layoutTitle/></title>
    <g:layoutHead/>

    <asset:stylesheet href="application-sbdi.css" />
    <g:if test="${hub}">
        <!-- Hub is not null-->
        <asset:stylesheet href="css/${hub}.css"/>
    </g:if>
    <g:else>
        <!-- Hub is null wheres the style sheet-->
        <asset:stylesheet href="generic.css"/>
    </g:else>
    <link rel="stylesheet" href="${config.headerAndFooter.baseURL}/css/app.css?DIGEST">
</head>

<body class="${pageProperty(name: 'body.class')}" id="${pageProperty(name: 'body.id')}"
      onload="${pageProperty(name: 'body.onload')}">

<g:set var="fluidLayout" value="${pageProperty(name: 'meta.fluidLayout') ?: config.skin?.fluidLayout}"/>

<!-- Banner -->
<ala:systemMessage/>
<g:if test="${config.skin.header}">
    <hf:banner/>
</g:if>
<!-- End banner -->

<!-- Container -->
<div class="${fluidLayout ? 'container-fluid' : 'container'}" id="main">
    <g:layoutBody/>
</div><!-- End container #main col -->

<!-- Footer -->
<g:if test="${config.skin.footer}">
    <hf:footer/>
</g:if>
<!-- End footer -->

<!-- JS resources -->
<script src="${config.headerAndFooter.baseURL}/js/vendor.js?DIGEST"></script>
<script src="${config.headerAndFooter.baseURL}/js/app.js?DIGEST"></script>
<script>require('js/init');</script>
<asset:deferredScripts />
<asset:javascript src="commonui-bs3-2019/js/application.min.js"/>
<asset:javascript src="commonui-bs3-2019.js"/>
</body>
</html>
