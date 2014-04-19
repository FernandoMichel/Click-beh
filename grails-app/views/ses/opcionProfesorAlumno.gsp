<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" charset="UTF-8"/>

	</head>
	<body>
                <div align="right">
                    <a href="http://localhost:8080/EscuelaIngles" class="menu" align="right"> Inicio </a> 
		</div>
                <h1>Bienvenido</h1>
		<p align="center">Elige tipo de usuario</p>
                <br>
		<a href="#page-body" class="skip">
		<div id="page-body" role="main" >
                    <div align="center">
                        <g:link controller="Alumno" action="create" class="menu">Alumno</g:link>
                        <g:link controller="Profesor" action="create" class="menu">Profesor</g:link>
                    </div>
	</body>
</html>