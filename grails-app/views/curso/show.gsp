
<%@ page import="escuelaingles.Curso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-curso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-curso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list curso">
			
				<g:if test="${cursoInstance?.nivel}">
				<li class="fieldcontain">
					<span id="nivel-label" class="property-label"><g:message code="curso.nivel.label" default="Nivel" /></span>
					
						<span class="property-value" aria-labelledby="nivel-label"><g:fieldValue bean="${cursoInstance}" field="nivel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.horario}">
				<li class="fieldcontain">
					<span id="horario-label" class="property-label"><g:message code="curso.horario.label" default="Horario" /></span>
					
						<span class="property-value" aria-labelledby="horario-label"><g:fieldValue bean="${cursoInstance}" field="horario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.aceptado}">
				<li class="fieldcontain">
					<span id="aceptado-label" class="property-label"><g:message code="curso.aceptado.label" default="Aceptado" /></span>
					
						<span class="property-value" aria-labelledby="aceptado-label"><g:formatBoolean boolean="${cursoInstance?.aceptado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.inscripciones}">
				<li class="fieldcontain">
					<span id="inscripciones-label" class="property-label"><g:message code="curso.inscripciones.label" default="Inscripciones" /></span>
					
						<g:each in="${cursoInstance.inscripciones}" var="i">
						<span class="property-value" aria-labelledby="inscripciones-label"><g:link controller="inscripcion" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.profesor}">
				<li class="fieldcontain">
					<span id="profesor-label" class="property-label"><g:message code="curso.profesor.label" default="Profesor" /></span>
					
						<span class="property-value" aria-labelledby="profesor-label"><g:link controller="profesor" action="show" id="${cursoInstance?.profesor?.id}">${cursoInstance?.profesor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cursoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cursoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
