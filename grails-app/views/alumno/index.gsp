
<%@ page import="escuelaingles.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-alumno" class="skip" tabindex="-1">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-alumno" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="correo" title="${message(code: 'alumno.correo.label', default: 'Correo')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'alumno.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellp" title="${message(code: 'alumno.apellp.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="apellm" title="${message(code: 'alumno.apellm.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="contrasena" title="${message(code: 'alumno.contrasena.label', default: 'Contraseña')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'alumno.telefono.label', default: 'Teléfono')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${alumnoInstanceList}" status="i" var="alumnoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${alumnoInstance.id}">${fieldValue(bean: alumnoInstance, field: "correo")}</g:link></td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "apellp")}</td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "apellm")}</td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "contrasena")}</td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "telefono")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${alumnoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
