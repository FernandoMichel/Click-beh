
<%@ page import="escuelaingles.Inscripcion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inscripcion.label', default: 'Inscripcion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inscripcion" class="skip" tabindex="-1"></a>
		<div id="list-inscripcion" class="content scaffold-list" role="main">
			<h1><g:message code=" " default="Alumnos que solicitan inscripción al curso" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="alumno.nombre" title="${message(code: 'inscripcion.aceptado.label', default: 'Alumno')}" />
						<th>Opciones de respuesta</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inscripcionInstanceList}" status="i" var="inscripcionInstance">
                                    <g:if test="${session.user.correo == inscripcionInstance.profesor.correo && inscripcionInstance.aceptado==false}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            
                                                <td>${fieldValue(bean: inscripcionInstance, field: "alumno")}</td>
					
						<td><g:form url="[resource:inscripcionInstance, action:'delete']" method="DELETE">
                                                            <g:actionSubmit action="aceptar" value="Aceptar" onclick="return confirm('¿Confirma aceptar inscripcion del alumno ${alumnoInstance}?')" />
                                                            <g:actionSubmit action="rechazar" value="Rechazar" onclick="return confirm('¿Confirma rechazar inscripcion del alumno ${alumnoInstance}?')" />
                                                    </g:form>
                                                </td>

					</tr>
                                    </g:if>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inscripcionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
