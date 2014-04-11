
<%@ page import="escuelaingles.Profesor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
            
             <div id="grailsLogo" role="banner"><a href="http://localhost:8080/EscuelaIngles/"><img src="${resource(dir: 'images', file: 'click-beh.png')}" alt="Grails" width="200" height="150"/></a></div>
                            <div align="center">
                            <a href="http://localhost:8080/EscuelaIngles" class="menu"> Inicio </a> 
                         
                            
                            </div>
                            
            
		<a href="#list-profesor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-profesor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'profesor.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellp" title="${message(code: 'profesor.apellp.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellm" title="${message(code: 'profesor.apellm.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="nivel" title="${message(code: 'profesor.nivel.label', default: 'Nivel')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${profesorInstanceList}" status="i" var="profesorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${profesorInstance.id}">${fieldValue(bean: profesorInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: profesorInstance, field: "apellp")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "apellm")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "nivel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profesorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
