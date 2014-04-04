<%@ page import="escuelaingles.Solicitud" %>



<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'curso', 'error')} required">
	<label for="curso">
		<g:message code="solicitud.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="curso" name="curso.id" from="${escuelaingles.Curso.list()}" optionKey="id" required="" value="${solicitudInstance?.curso?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'profesor', 'error')} required">
	<label for="profesor">
		<g:message code="solicitud.profesor.label" default="Profesor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesor" name="profesor.id" from="${escuelaingles.Profesor.list()}" optionKey="id" required="" value="${solicitudInstance?.profesor?.id}" class="many-to-one"/>
</div>

