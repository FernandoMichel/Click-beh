<!DOCTYPE html>
<html>
	<head>
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
					<li id="contact"><g:link controller="ses" action="irAOpcion" class="menu current">Registro</g:link> </li>
				</ul>
			</div>
		</div>
                </div>
		<a href="#create-alumno" class="skip" tabindex="-1"></a>
		
        <div id="create-alumno" class="content scaffold-create" role="main" style="width: 50%; margin-left: 20%;" >
                        <div style="clear:both;">
			<h1><g:message code=" " default="Llena tus datos para ser alumno" /></h1>
                        </div>
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
					<g:submitButton name="create" class="save" value="${message(code: ' ', default: 'Registrar')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
