<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" charset="UTF-8"/>
		<title>Escuela</title>
		<style type="text/css" media="screen">
                    
                        body {
                            
                        }
                        r1{
                            font-style:italic;
                           
                        }
                        
                     
                        
			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
                          
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
                        
				}

				#page-body h1 {
					margin-top: 10;
                                        background-color:black;
				}
                              
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                              <a href="http://localhost:8080/EscuelaIngles" class="menu"> Inicio </a> 
                                <g:link controller="profesor" action="verCursosVisitante" class="menu">Ver Cursos</g:link>
                            <!--<g:link controller="inscripcion" action="solicitudesDeInscripcion" class="menu">Solicitudes de inscripcion</g:link>
                            <g:link controller="profesor" action="verCursosAlumno" class="menu">Inscribir</g:link> 
                             <g:link controller="profesor" action="verificarDatosProfesor" class="menu">Verificar datos profesor</g:link>-->
                            <g:link controller="ses" action="iniciarSesion" class="menu">Iniciar Sesion</g:link>
                            <g:link controller="ses" action="irAOpcion" class="menu">Registro</g:link> 
                           
                <div id="page-body" role="main" >
                        
                    <h1>Bienvenido</h1>
			<p>En esta página podrás inscribirte a cursos personales de inglés, o registrarte como profesor para dar clases tu mismo</p>
                        
                        
                          
			</div>
                        
		</div>
	</body>
</html>