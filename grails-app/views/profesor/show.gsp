
<%@ page import="escuelaingles.Profesor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profesor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profesor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profesor">
			
				<g:if test="${profesorInstance?.correo}">
				<li class="fieldcontain">
					<span id="correo-label" class="property-label"><g:message code="profesor.correo.label" default="Correo" /></span>
					
						<span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${profesorInstance}" field="correo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="profesor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${profesorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.apellp}">
				<li class="fieldcontain">
					<span id="apellp-label" class="property-label"><g:message code="profesor.apellp.label" default="Apellp" /></span>
					
						<span class="property-value" aria-labelledby="apellp-label"><g:fieldValue bean="${profesorInstance}" field="apellp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.apellm}">
				<li class="fieldcontain">
					<span id="apellm-label" class="property-label"><g:message code="profesor.apellm.label" default="Apellm" /></span>
					
						<span class="property-value" aria-labelledby="apellm-label"><g:fieldValue bean="${profesorInstance}" field="apellm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.contrasena}">
				<li class="fieldcontain">
					<span id="contrasena-label" class="property-label"><g:message code="profesor.contrasena.label" default="Contrasena" /></span>
					
						<span class="property-value" aria-labelledby="contrasena-label"><g:fieldValue bean="${profesorInstance}" field="contrasena"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.nivel}">
				<li class="fieldcontain">
					<span id="nivel-label" class="property-label"><g:message code="profesor.nivel.label" default="Nivel" /></span>
					
						<span class="property-value" aria-labelledby="nivel-label"><g:fieldValue bean="${profesorInstance}" field="nivel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.horario}">
				<li class="fieldcontain">
					<span id="horario-label" class="property-label"><g:message code="profesor.horario.label" default="Horario" /></span>
					
						<span class="property-value" aria-labelledby="horario-label"><g:fieldValue bean="${profesorInstance}" field="horario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.aceptado}">
				<li class="fieldcontain">
					<span id="aceptado-label" class="property-label"><g:message code="profesor.aceptado.label" default="Aceptado" /></span>
					
						<span class="property-value" aria-labelledby="aceptado-label"><g:formatBoolean boolean="${profesorInstance?.aceptado}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:profesorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${profesorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
