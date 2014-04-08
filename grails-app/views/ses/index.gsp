<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" charset="UTF-8"/>
		<title>Escuela</title>
		<style type="text/css" media="screen">
                    
                        body {
                            background: -webkit-linear-gradient(#F01E1E, #F01E1E);
                            background: -moz-linear-gradient(#F01E1E, #F01E1E);
                            background: -o-linear-gradient(#F01E1E, #F01E1E);
        
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
            
            <g:form url="[action:'iniciar',controller:'ses']" >
            
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="page-body" role="main" >
                        <div align ="right" id="r1">
                            <g:link controller="profesor" action="verCursosVisitante">Ver Cursos</g:link>
                            <g:link controller="inscripcion" action="solicitudesDeInscripcion">Solicitudes de inscripcion</g:link>
                            <g:link controller="profesor" action="verCursosAlumno">Inscribir</g:link>
                            <g:link controller="profesor" action="verificarDatosProfesor">Verificar datos profesor</g:link>
                        
                        </div>
                    <h1>Bienvenido</h1>
			<p>En esta página podrás inscribirte a cursos personales de inglés, o registrarte como profesor para dar clases tu mismo</p>
                        
                        
                            
                                <br>
                                

                                       <table class="userForm">
                                        <tr class='prop'>
                                            <td valign='top' style='text-align:left;' width='20%'>
                                    <label for='email'>Correo:</label>
 </td>
<td valign='top' style='text-align:left;' width='80%'>
 <input id="email" type='text' name='email' value='${user?.email}' />
 </td>
 </tr>
 <tr class='prop'>
 <td valign='top' style='text-align:left;' width='20%'>
 <label for='password'>Password:</label>
 </td>
<td valign='top' style='text-align:left;' width='80%'>
<input id="password" type='password' name='password'value='${user?.password}' />
 </td>
 </tr>
 
 </table> 
 </div>
 <div class="buttons">
 <span class="formButton">
 <input type="submit" value="Iniciar"></input>
 </span>
 </div>

                                
                                
                                <br>
                                <h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
                        
		</div>
                
                </g:form>
                
	</body>
</html>