<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<g:javascript library="application"/>		
		<r:layoutResources />
	</head>
	<body>
            
            <div id="grailsLogo" role="banner"><a href="http://localhost:8080/EscuelaIngles/"><img src="${resource(dir: 'images', file: 'click-beh.png')}" alt="Grails" width="200" height="150"/></a></div>
                            <div align="center">
                            <a href="http://localhost:8080/EscuelaIngles" class="menu"> Inicio </a> 
                            <g:link controller="profesor" action="verCursosVisitante" class="menu">Ver Cursos</g:link>
                            <g:link controller="inscripcion" action="solicitudesDeInscripcion" class="menu">Solicitudes de inscripcion</g:link>
                            <g:link controller="profesor" action="verCursosAlumno" class="menu">Inscribir</g:link>
                            <g:link controller="profesor" action="verificarDatosProfesor" class="menu">Verificar datos profesor</g:link>
                            <g:link controller="ses" action="iniciarSesion" class="menu">Iniciar Sesion</g:link>
                            </div>
            <br>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<r:layoutResources />
	</body>
</html>
