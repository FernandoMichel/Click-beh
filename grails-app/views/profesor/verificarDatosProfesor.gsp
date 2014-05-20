
<%@ page import="escuelaingles.Profesor" %>
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
  
		
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
   
                                        <li id="cerrar"><g:link controller="ses" action="logout" class="menu"> Cerrar sesión </g:link><li>

				</ul>
			</div>
		</div>
		<!-- END NAVIGATION -->
		
		<div class="clear"></div>
	</div>
	<body>
		<a href="#list-profesor" class="skip" tabindex="-1">

		<div id="list-profesor" class="content scaffold-list" role="main">
			<h1><g:message code=" " default="Profesores postulados para dar cursos"  /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nivel" title="${message(code: 'profesor.nivel.label', default: 'Nivel')}" />
					
						<g:sortableColumn property="horario" title="${message(code: 'profesor.nivel.label', default: 'Horario')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'profesor.nombre.label', default: 'Profesor')}" />
					
						<g:sortableColumn property="dirCertificado" title="${message(code: 'profesor.nombre.label', default: 'Certificado')}" />
					
						<g:sortableColumn property="dirVideo" title="${message(code: 'profesor.nombre.label', default: 'Video de introduccion')}" />
                                                
                                                <th>Opciones de respuesta</th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${profesorInstanceList}" status="i" var="profesorInstance">
                                    <g:if test="${!profesorInstance.aceptado && profesorInstance.correo!="noreply.clickbeh@gmail.com"}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: profesorInstance, field: "nivel")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "horario")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "nombre")}
					
						${fieldValue(bean: profesorInstance, field: "apellp")}
					
						${fieldValue(bean: profesorInstance, field: "apellm")}</td>
                                                
                                                
                                                <td>
                                            <embed src="../files/${profesorInstance.dirCertificado}" width="600" height="500" alt="pdf" pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">

                                                </td>
                                                <td>
                                                      <video width="320" height="240" controls>
                                                        <source src="../files/${profesorInstance.dirVideo}" type="video/mp4">
                                                            </video>
                                                          </td>
					
						<td><g:form url="[resource:profesorInstance, action:'save']" >
                                                            <g:actionSubmit action="aceptar" value="Aceptar" onclick="return confirm('¿Confirma aceptar registro del profesor ${profesorInstance}?')"/>
                                                            <g:actionSubmit action="rechazar" value="Rechazar" onclick="return confirm('¿Confirma rechazar registro del profesor ${profesorInstance}?')"/>
                                                    </g:form></td>
					</tr>
                                    </g:if>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profesorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
