<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: ' ', default: 'Alumno')}" />
		<title>Registro Profesor</title>
                <meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: ' ', default: 'Alumno')}" />
		<title>Registro Alumno</title>
                <meta name="layout" content="main" charset="UTF-8"/>
                <meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
                <link rel="shortcut icon" href="../images/logo.ico" ></link>
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
		<div style="clear:both">
		<div id="create-profesor" class="content scaffold-create" role="main">
			<h1><g:message code=" " default="Llena tus datos para ser profesor" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${profesorInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profesorInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:uploadForm url="[resource:profesorInstance, action:'save']" >
				<fieldset class="form" >
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value='Registrar' />
				</fieldset>
			</g:uploadForm>
		</div>
                </div>
	</body>
</html>
