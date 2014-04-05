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
		<g:message code="profesor.apellp.label" default="Apellp" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellp" required="" value="${profesorInstance?.apellp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'apellm', 'error')} required">
	<label for="apellm">
		<g:message code="profesor.apellm.label" default="Apellm" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellm" required="" value="${profesorInstance?.apellm}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'contrasena', 'error')} required">
	<label for="contrasena">
		<g:message code="profesor.contrasena.label" default="Contrasena" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contrasena" required="" value="${profesorInstance?.contrasena}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="profesor.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nivel" from="${profesorInstance.constraints.nivel.inList}" required="" value="${profesorInstance?.nivel}" valueMessagePrefix="profesor.nivel"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'horario', 'error')} required">
	<label for="horario">
		<g:message code="profesor.horario.label" default="Horario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="horario" required="" value="${profesorInstance?.horario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'aceptado', 'error')} ">
	<label for="aceptado">
		<g:message code="profesor.aceptado.label" default="Aceptado" />
		
	</label>
	<g:checkBox name="aceptado" value="${profesorInstance?.aceptado}" />
</div>

