
<%@ page import="escuelaingles.Profesor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
                <link rel="shortcut icon" href="./images/logo.ico" ></link>
                <link rel="stylesheet" href="../css/screen.css" type="text/css" media="screen, projection" />
                <link rel="stylesheet" href="../css/960.css" type="text/css" media="screen, projection" />
                <link rel="stylesheet" href="../css/print.css" type="text/css" media="print" /> 
                <link rel="stylesheet" href="../css/project.css" type="text/css" media="screen, projection" />
    
	</head>
	<body>
                  <div class="container_12" >
		<div class="grid_4 header">
			<a href="index.htm"><img src="../images/logo.png" alt="Click-Beh" width="150" height="112" /></a>
		</div>
		<!-- END LOGO -->
   	 
		<!-- START NAVIGATION -->
              
   	  	<div class="grid_8 header">
   	  		<div id="navigation">
				<ul id="nav">
   
					<li id="home"><a href="http://localhost:8080/EscuelaIngles" title="Home page" class="menu">Inicio</a></li>
					<li id="about"><g:link controller="profesor" action="verCursosVisitante" class="menu">Ver Cursos</g:link></li>
					<li id="portfolio"> <g:link controller="ses" action="iniciarSesion" class="menu">Iniciar Sesion</g:link></li>
					<li id="contact"><g:link controller="ses" action="irAOpcion" class="menu">Registro</g:link> </li>
				</ul>
			</div>
		</div>
                </div>
		<div id="list-profesor" class="content scaffold-list" role="main" style="clear:both;">
                <div>  	
                <h1><g:message code=" " default="Cursos disponibles:" /></h1>
                 </div>     
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nivel" title="${message(code: 'profesor.nivel.label', default: 'Nivel')}" />
					
						<g:sortableColumn property="horario" title="${message(code: 'profesor.nivel.label', default: 'Horario')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'profesor.nombre.label', default: 'Profesor')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${profesorInstanceList}" status="i" var="profesorInstance">
                                    <g:if test="${profesorInstance.aceptado}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: profesorInstance, field: "nivel")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "horario")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "nombre")}
					
						${fieldValue(bean: profesorInstance, field: "apellp")}
					
						${fieldValue(bean: profesorInstance, field: "apellm")}</td>
					
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
