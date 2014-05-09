<!DOCTYPE html>
<html>
	<head>
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
   
					<li id="home"><a href="http://localhost:8080/EscuelaIngles" title="Home page" class="otherPage">Inicio</a></li>
					<li id="about"><g:link controller="profesor" action="verCursosVisitante" class="otherPage">Ver Cursos</g:link></li>
					<li id="portfolio"> <g:link controller="ses" action="iniciarSesion" class="otherPage">Iniciar Sesion</g:link></li>
					<li id="contact"><g:link controller="ses" action="irAOpcion" class="currentPage">Registro</g:link> </li>
				</ul>
			</div>
		</div>
                </div>
                 <div style="clear:both;">
                                  </div>
		<p align="center">Elige tipo de usuario</p>
                <br>
		<a href="#page-body" class="skip">
		<div id="page-body" role="main" >
                    <div align="center">
                        <g:link controller="Alumno" action="create" class="menu" style="color:black;" >Alumno</g:link>
                        <g:link controller="Profesor" action="create" class="menu" style="color:black;" >Profesor</g:link>
                    </div>
	</body>
</html>