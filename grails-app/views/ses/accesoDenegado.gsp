<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" charset="UTF-8"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <!-- [template css] begin -->
    <link rel="shortcut icon" href="../images/logo.ico" ></link>
	<link rel="stylesheet" href="../css/screen.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="../css/960.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="../css/print.css" type="text/css" media="print" /> 
    <!--[if IE]>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen, projection" />
    <![endif]-->
    <!-- [template css] end -->
    
    <!-- [template css javascript] begin -->    
    <link rel="stylesheet" href="../css/project.css" type="text/css" media="screen, projection" />
    <!-- [template css javascript] end -->
	
	<!-- [JS] begin -->
    <script  type="text/javascript" src="../js/jquery-1.3.1.min.js"></script> 
    <script  type="text/javascript" src="../js/scripts.js"></script>
    <script  type="text/javascript" src="../js/coda-slider.1.1.1.js"></script>
    <script  type="text/javascript" src="../js/jquery-easing-compatibility.1.2.pack.js"></script>
    <script  type="text/javascript" src="../js/jquery-easing.1.2.pack.js"></script>
    <!-- [JS] end -->
  
		
	</head>
	<body>

                <div id="page-body" role="main" >
                      	
	<!-- START TOP SECTION -->
	<div class="container_12" >
	
		<!-- START LOGO -->
		<div class="grid_4 header">
			<img src="../images/logo.png" alt="Click-Beh" width="150" height="112" />  
		</div>
		<!-- END LOGO -->
   	 
		<!-- START NAVIGATION -->
   	  	<div class="grid_8 header">
   	  		<div id="navigation">
				<ul id="nav">
                                    <g:if test="${session.user}">
                                        <g:if test="${session.user=="Administrador"}">
                                            <li id="cerrar"><g:link controller="profesor" action="verificarDatosProfesor" class="menu"> InicioAdmin </g:link><li>
                                        </g:if>
                                        <g:else>
                                            <g:if test="${session.user.instanceOf(Profesor)}">
                                                <li id="cerrar"><g:link controller="profesor" action="interfazProfesor" class="menu"> InicioProf </g:link><li>
                                            </g:if>
                                            <g:if test="${session.user.instanceOf(Alumno)}">
                                                <li id="cerrar"><g:link controller="alumno" action="interfazAlumno" class="menu"> InicioAlum </g:link><li>
                                            </g:if>
                                        </g:else>
                                    </g:if>
                                    <g:else>
                                        <li id="cerrar"><g:link uri=" " class="menu"> InicioGlobal </g:link><li>
                                    </g:else>
				</ul>
			</div>
		</div>
		<!-- END NAVIGATION -->
		
		<div class="clear"></div>
	</div>
	<!-- END TOP SECTION -->
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        
   	<div class="container_12">
            <g:if test="${session.user}">
	   	<p>
                    Lo sentimos, pero tu cuenta no tiene los permisos necesarios para ver esta página.<br>
                    Por favor da click en el botón 'Inicio' arriba para regresar a tu página principal, o utiliza la función 'atrás' de tu navegador para regresar a lo que estabas haciendo.
		</p>
            </g:if>
            <g:else>
	   	<p>
                    Lo sentimos, pero no tienes los permisos necesarios para ver esta página.<br>
                    Por favor da click en el botón 'Inicio' arriba para regresar a la página principal e inicia sesión para poder acceder.
		</p>
            </g:else>
	</div>
        
   	<!-- START FOOTER -->
   	<div class="container_12">
	   	<p class="footer">
	   		Copyright 2014 by <strong><i>Clic-Beh</i></strong> <br/>
		</p>
	</div>
	<!-- END FOOTER -->
                 
                          
			</div>
                        
		
	</body>
</html>