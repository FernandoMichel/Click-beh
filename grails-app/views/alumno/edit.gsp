    <%@ page import="escuelaingles.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
            <meta name="layout" content="main" charset="UTF-8"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <!-- [template css] begin -->
    <link rel="shortcut icon" href="../../images/logo.ico" ></link>
	<link rel="stylesheet" href="../../css/screen.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="../../css/960.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="../../css/print.css" type="text/css" media="print" /> 
    <!--[if IE]>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen, projection" />
    <![endif]-->
    <!-- [template css] end -->
    
    <!-- [template css javascript] begin -->    
    <link rel="stylesheet" href="../../css/project.css" type="text/css" media="screen, projection" />
    <!-- [template css javascript] end -->
	
	<!-- [JS] begin -->
    <script  type="text/javascript" src="../../js/jquery-1.3.1.min.js"></script> 
    <script  type="text/javascript" src="../../js/scripts.js"></script>
    <script  type="text/javascript" src="../../js/coda-slider.1.1.1.js"></script>
    <script  type="text/javascript" src="../../js/jquery-easing-compatibility.1.2.pack.js"></script>
    <script  type="text/javascript" src="../../js/jquery-easing.1.2.pack.js"></script>
    <!-- [JS] end -->
    
            <div class="container_12" >

                        <!-- START LOGO -->
                        <div class="grid_4 header">
                                <img src="../../images/logo.png" alt="Click-Beh" width="150" height="112" />  
                        </div>
                        <!-- END LOGO -->

                        <!-- START NAVIGATION -->
                        <div class="grid_8 header">
                                <div id="navigation">
                                        <ul id="nav">

                                                <li id="home"><g:link controller="alumno" action="interfazAlumno" class="menu">Inicio</g:link></li>
                                                <li id="about"><g:link controller="profesor" action="verCursosAlumno" class="menu">Inscripciones</g:link></li>
                                                <li id="portfolio"> <g:link controller="alumno" action="consultarCalifacacion" class="menu">Calificaciones</g:link></li>
                                                <li id="manejar"> <g:link class="menu" controller="Alumno" action="edit" resource="${session.user}">Manejar Cuenta</g:link></li>
                                                <li id="cerrar"><g:link controller="ses" action="logout" class="menu"> Cerrar sesión </g:link><li>

                                        </ul>
                                </div>
                        </div>
                        <!-- END NAVIGATION -->

                        <div class="clear"></div>
                </div>
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-alumno" class="skip" tabindex="-1"></a>
		
		<div id="edit-alumno" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			<g:form url="[resource:alumnoInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${alumnoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
