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
  
		
		<g:set var="entityName" value="${message(code: 'inscripcion.label', default: 'Inscripcion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
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
   
					<li id="home"><g:link controller="alumno" action="interfazAlumno" class="menu">Inicio</g:link></li>
					<li id="about"><g:link controller="profesor" action="verCursosAlumno" class="menu">Inscripciones</g:link></li>
					<li id="portfolio"> <g:link controller="inscripcion" action="consultarCalificacion" class="menu">Calificaciones</g:link></li>
                                        <li id="manejar"> <g:link class="menu" controller="Alumno" action="edit" resource="${session.user}">Manejar Cuenta</g:link></li>
                                        <li id="cerrar"><g:link controller="ses" action="logout" class="menu"> Cerrar sesión </g:link><li>

				</ul>
			</div>
		</div>
		<!-- END NAVIGATION -->
		
		<div class="clear"></div>
		<a href="#list-inscripcion" class="skip" tabindex="-1"></a>
		<div id="list-inscripcion" class="content scaffold-list" role="main">
			<h1><g:message code=" " default="Calificaciones" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="profesor.nombre" title="${message(code: ' ', default: 'Profesor')}" />
						<g:sortableColumn property="nivel" title="Nivel" />
						<g:sortableColumn property="calificacion" title="Calificación" />
						<g:sortableColumn property="dirConstancia" title="Constancia" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inscripcionInstanceList}" status="i" var="inscripcionInstance">
                                    <g:if test="${session.user.correo == inscripcionInstance.alumno.correo && inscripcionInstance.aceptado==true}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            
                                                <td>${fieldValue(bean: inscripcionInstance, field: "profesor")}</td>
                                                <td>${fieldValue(bean: inscripcionInstance, field: "profesor.nivel")}</td>
                                                <td><g:if test="${inscripcionInstance.calificacion==-1}">
                                                        Aún no hay calificación para este curso
                                                    </g:if>
                                                    <g:else>
                                                        ${fieldValue(bean: inscripcionInstance, field: "calificacion")}
                                                    </g:else>
                                                </td>
                                                <td><g:if test="${inscripcionInstance.dirConstancia!=null}">
                                                        <embed src="../files/${inscripcionInstance.dirConstancia}" width="600" height="500" alt="pdf" pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">
                                                    </g:if>
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
