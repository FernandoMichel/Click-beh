
<%@ page import="escuelaingles.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-alumno" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list alumno">
			
				<g:if test="${alumnoInstance?.correo}">
				<li class="fieldcontain">
					<span id="correo-label" class="property-label"><g:message code="alumno.correo.label" default="Correo" /></span>
					
						<span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${alumnoInstance}" field="correo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="alumno.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${alumnoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.apellp}">
				<li class="fieldcontain">
					<span id="apellp-label" class="property-label"><g:message code="alumno.apellp.label" default="Apellp" /></span>
					
						<span class="property-value" aria-labelledby="apellp-label"><g:fieldValue bean="${alumnoInstance}" field="apellp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.apellm}">
				<li class="fieldcontain">
					<span id="apellm-label" class="property-label"><g:message code="alumno.apellm.label" default="Apellm" /></span>
					
						<span class="property-value" aria-labelledby="apellm-label"><g:fieldValue bean="${alumnoInstance}" field="apellm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.contrasena}">
				<li class="fieldcontain">
					<span id="contrasena-label" class="property-label"><g:message code="alumno.contrasena.label" default="Contrasena" /></span>
					
						<span class="property-value" aria-labelledby="contrasena-label"><g:fieldValue bean="${alumnoInstance}" field="contrasena"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="alumno.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${alumnoInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.inscripciones}">
				<li class="fieldcontain">
					<span id="inscripciones-label" class="property-label"><g:message code="alumno.inscripciones.label" default="Inscripciones" /></span>
					
						<g:each in="${alumnoInstance.inscripciones}" var="i">
						<span class="property-value" aria-labelledby="inscripciones-label"><g:link controller="inscripcion" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:alumnoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${alumnoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
