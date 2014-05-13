
<%@ page import="escuelaingles.Profesor" %>
<%@ page import="escuelaingles.Inscripcion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
                </div>
	<body>
		<a href="#list-profesor" class="skip" tabindex="-1">

		<div id="list-profesor" class="content scaffold-list" role="main">
			<h1><g:message code=" " default="Cursos disponibles" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nivel" title="${message(code: 'profesor.nivel.label', default: 'Nivel')}" />
					
						<g:sortableColumn property="horario" title="${message(code: 'profesor.nivel.label', default: 'Horario')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'profesor.nombre.label', default: 'Profesor')}" />
                                                
                                                <g:sortableColumn property="nombre" title="${message(code: 'profesor.nombre.label', default: 'Video')}" />
                                                

					</tr>
				</thead>
				<tbody>
				<g:each in="${profesorInstanceList}" status="i" var="profesorInstance">
                                    <g:set var="inscripcionInstance" value="${Inscripcion.findWhere(alumno: (session.user), profesor:profesorInstance)}"/>
                                    <g:if test="${profesorInstance.aceptado && inscripcionInstance==null}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: profesorInstance, field: "nivel")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "horario")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "nombre")}
					
						${fieldValue(bean: profesorInstance, field: "apellp")}
					
						${fieldValue(bean: profesorInstance, field: "apellm")}</td>
					
						<td><g:form url="[resource:profesorInstance, action:'save']" >
                                                            <g:actionSubmit action="inscribir" value="Inscribir" onclick="return confirm('¿Inscribir el curso de nivel ${profesorInstance.nivel} con el profesor ${profesorInstance}?')" />
                                                    </g:form></td>
                                        <td>          
                                        <video width="320" height="240" controls>
                                                        <source src="../files/${profesorInstance.dirVideo}" type="video/mp4">
                                                            </video>
                                                          
                                        </td>   
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
