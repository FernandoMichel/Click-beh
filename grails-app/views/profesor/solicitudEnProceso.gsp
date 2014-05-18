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
					<li id="home"><g:link controller="profesor" action="interfazProfesor" class="menu">Inicio</g:link></li>
                                        <li id="manejar"> <g:link class="menu" controller="Profesor" action="edit" resource="${session.user}">Manejar Cuenta</g:link></li>
                                        <li id="cerrar"><g:link controller="ses" action="logout" class="menu"> Salir </g:link><li>
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
	   	<p>
                    Gracias por registrarte para dar cursos con nosotros!<br>
                    Se ha realizado tu solicitud de registro como profesor y en estos momentos se está procesando, en breve te enviaremos un correo electrónico a la dirección que proporcionaste (${session.user.correo}) para informarte si se aceptó la solicitud.<br>
                    Hasta entonces no podrás acceder a las opciones que te permiten controlar tus grupos, pero puedes modificar los datos de tu cuenta si lo deseas.
		</p>
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