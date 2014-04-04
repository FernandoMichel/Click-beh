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

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'cursos', 'error')} ">
	<label for="cursos">
		<g:message code="profesor.cursos.label" default="Cursos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${profesorInstance?.cursos?}" var="c">
    <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curso" action="create" params="['profesor.id': profesorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
</li>
</ul>

</div>

