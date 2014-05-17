
<%@ page import="escuelaingles.Inscripcion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" charset="UTF-8"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <!-- [template css] begin -->
    <link rel="shortcut icon" href="../images/logo.ico" ></link>
	<link rel="stylesheet" href="../css/screen.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="../css/960.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="../css/print.css" type="text/css" media="print" /> 
    <!--[if IE]>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen, projection" />
    <![endif]-->
    <!-- [template css] end -->
    
    <!-- [template css javascript] begin -->    
    <link rel="stylesheet" href="../css/project.css" type="text/css" media="screen, projection" />
    <!-- [template css javascript] end -->
	
	<!-- [JS] begin -->
    <script  type="text/javascript" src="../js/jquery-1.3.1.min.js"></script> 
    <script  type="text/javascript" src="../js/scripts.js"></script>
    <script  type="text/javascript" src="../js/coda-slider.1.1.1.js"></script>
    <script  type="text/javascript" src="../js/jquery-easing-compatibility.1.2.pack.js"></script>
    <script  type="text/javascript" src="../js/jquery-easing.1.2.pack.js"></script>
    <!-- [JS] end -->
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inscripcion.label', default: 'Inscripcion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

                <div id="page-body" role="main" >
                      	
	<!-- START TOP SECTION -->
	<div class="container_12" >
	
		<!-- START LOGO -->
		<div class="grid_4 header">
			<img src="../images/logo.png" alt="Click-Beh" width="150" height="112" />  
		</div>
		<!-- END LOGO -->
   	 
		<!-- START NAVIGATION -->
   	  	<div class="grid_8 header">
   	  		<div id="navigation">
				<ul id="nav">
   
					<li id="home"><g:link controller="profesor" action="interfazProfesor" class="menu">Inicio</g:link></li>
					<li id="about"><g:link controller="inscripcion" action="solicitudesDeInscripcion" class="menu">Inscripciones</g:link></li>
					<li id="portfolio"> <g:link controller="inscripcion" action="calificar" class="menu">Calificaciones</g:link></li>
                                        <li id="manejar"> <g:link class="menu" controller="Profesor" action="edit" resource="${session.user}">Manejar Cuenta</g:link></li>
                                        <li id="cerrar"><g:link controller="ses" action="logout" class="menu"> Cerrar sesión </g:link><li>

				</ul>
			</div>
		</div>
		<!-- END NAVIGATION -->
		
		<div class="clear"></div>
	</div>
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
                                                            <g:actionSubmit action="aceptar" value="Aceptar" onclick="return confirm('¿Confirma aceptar inscripcion del alumno ${inscripcionInstance.alumno}?')" />
                                                            <g:actionSubmit action="rechazar" value="Rechazar" onclick="return confirm('¿Confirma rechazar inscripcion del alumno ${inscripcionInstance.alumno}?')" />
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
