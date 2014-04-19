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
	</head>
	<body>
            <div align="right">
                <a href="http://localhost:8080/EscuelaIngles" class="menu" align="right"> Inicio </a> 
            </div>
            <g:form url="[action:'iniciarUsuario',controller:'ses']" >   
		<div id="page-body" role="main" >
                <br>
                <td valign='top' style='text-align:left;' width='50'>
                    Correo: <input type="text" name="correo" value="${user?.correo}" tabindex="right"><br>
                    <br>
                    Password: <input type="password" name="contrasena" value="${user?.contrasena}">
                    <br>
                    <br>    
                    <input type="submit" value="Iniciar"></input>
                </td>      
                </div>     
                </g:form>
                
	</body>
</html>