<%@ page import="escuelaingles.Profesor" %>



<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="profesor.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="correo" required="" value="${profesorInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="profesor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${profesorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'apellp', 'error')} required">
	<label for="apellp">
		<g:message code="profesor.apellp.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellp" required="" value="${profesorInstance?.apellp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'apellm', 'error')} required">
	<label for="apellm">
		<g:message code="profesor.apellm.label" default="Apellido Materno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellm" required="" value="${profesorInstance?.apellm}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'contrasena', 'error')} required">
	<label for="contrasena">
		<g:message code="profesor.contrasena.label" default="Contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="contrasena" required="" value="${profesorInstance?.contrasena}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'confContrasena', 'error')} required">
	<label for="confContrasena">
		<g:message code="profesor.confContrasena.label" default="Confirmar Contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="confContrasena" required="" value="${profesorInstance?.confContrasena}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'horario', 'error')} required">
	<label for="horario">
		<g:message code="profesor.horario.label" default="Horario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="horario" required="" value="${profesorInstance?.horario}"/>
</div>

