<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: ' ', default: 'Alumno')}" />
		<title>Registro Alumno</title>
	</head>
	<body>
		<a href="#create-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="create-alumno" class="content scaffold-create" role="main">
			<h1><g:message code=" " default="Llena tus datos para ser alumno" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${alumnoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${alumnoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:alumnoInstance, action:'save']" >
				<fieldset class="form" >
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: ' ', default: 'Aceptar')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
