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
                                        color = "white";
                        
				}

				#page-body h1 {
					margin-top: 10;
                                        background-color:black;
				}
                              
			}
		</style>
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
					<li id="portfolio"> <g:link controller="ses" action="iniciarSesion" class="currentPage">Iniciar Sesion</g:link></li>
					<li id="contact"><g:link controller="ses" action="irAOpcion" class="otherPage">Registro</g:link> </li>
				</ul>
			</div>
		</div>
                </div>
               <div style="clear:both; width: 50%; margin-left: auto;margin-right: auto;">
            <g:form url="[action:'iniciarUsuario',controller:'ses']" >   
		<div id="page-body" role="main" >
                <br>
                <td valign='top' style='text-align:left;' width='50'>
                    Correo: <input type="text" name="correo" value="${user?.correo}" tabindex="right"><br>
                    <br>
                    Contraseña: <input type="password" name="contrasena" value="${user?.contrasena}">
                    <br>
                    <br>    
                    <input type="submit" value="Iniciar"></input>
                </td>      
                </div>     
                </g:form>
                </div>
	</body>
</html>