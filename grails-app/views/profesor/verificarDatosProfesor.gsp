
<%@ page import="escuelaingles.Profesor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-profesor" class="skip" tabindex="-1">

		<div id="list-profesor" class="content scaffold-list" role="main">
			<h1><g:message code=" " default="Profesores postulados para dar cursos"  /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nivel" title="${message(code: 'profesor.nivel.label', default: 'Nivel')}" />
					
						<g:sortableColumn property="horario" title="${message(code: 'profesor.nivel.label', default: 'Horario')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'profesor.nombre.label', default: 'Profesor')}" />
					
						<g:sortableColumn property="dirCertificado" title="${message(code: 'profesor.nombre.label', default: 'Certificado')}" />
					
						<g:sortableColumn property="dirVideo" title="${message(code: 'profesor.nombre.label', default: 'Video de introduccion')}" />
                                                
                                                <th>Opciones de respuesta</th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${profesorInstanceList}" status="i" var="profesorInstance">
                                    <g:if test="${!profesorInstance.aceptado}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: profesorInstance, field: "nivel")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "horario")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "nombre")}
					
						${fieldValue(bean: profesorInstance, field: "apellp")}
					
						${fieldValue(bean: profesorInstance, field: "apellm")}</td>
                                                
                                                <td><a href="/escuelaingles/files/${profesorInstance?.dirCertificado}">Certificado</a></td>
                                                
                                                <td><a href="/escuelaingles/files/${profesorInstance?.dirVideo}">Video de Introduccion</a></td>
					
						<td><g:form url="[resource:profesorInstance, action:'save']" >
                                                            <g:actionSubmit action="aceptar" value="Aceptar" onclick="return confirm('¿Confirma aceptar registro del profesor ${profesorInstance}?')"/>
                                                            <g:actionSubmit action="rechazar" value="Rechazar" onclick="return confirm('¿Confirma rechazar registro del profesor ${profesorInstance}?')"/>
                                                    </g:form></td>
					</tr>
                                    </g:if>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profesorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
