<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" charset="UTF-8"/>

	</head>
	<body>
            	<div align="right">
                    <a href="http://localhost:8080/EscuelaIngles" class="menu" align="right"> Inicio </a> 
		</div>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="page-body" role="main" >
                        
                    <h1>Bienvenido</h1>
			<p>Elige tipo de usuario</p>
                        
                            <div align="center">
                                <g:link controller="Alumno" action="create" class="menu">Alumno</g:link>
                                <g:link controller="Profesor" action="create" class="menu">Profesor</g:link>
                                </div>
	</body>
</html>