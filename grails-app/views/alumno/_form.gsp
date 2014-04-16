<%@ page import="escuelaingles.Alumno" %>



<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="alumno.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="correo" required="" value="${alumnoInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="alumno.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${alumnoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apellp', 'error')} required">
	<label for="apellp">
		<g:message code="alumno.apellp.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellp" required="" value="${alumnoInstance?.apellp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apellm', 'error')} required">
	<label for="apellm">
		<g:message code="alumno.apellm.label" default="Apellido Materno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellm" required="" value="${alumnoInstance?.apellm}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'contrasena', 'error')} required">
	<label for="contrasena">
		<g:message code="alumno.contrasena.label" default="Contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="contrasena" required="" value="${alumnoInstance?.contrasena}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'confContrasena', 'error')} required">
	<label for="confContrasena">
		<g:message code="alumno.confContrasena.label" default="Confirmar Contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="confContrasena" required="" value="${alumnoInstance?.confContrasena}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="alumno.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${alumnoInstance?.telefono}"/>
</div>



