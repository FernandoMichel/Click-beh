<%@ page import="escuelaingles.Inscripcion" %>



<div class="fieldcontain ${hasErrors(bean: inscripcionInstance, field: 'aceptado', 'error')} ">
	<label for="aceptado">
		<g:message code="inscripcion.aceptado.label" default="Aceptado" />
		
	</label>
	<g:checkBox name="aceptado" value="${inscripcionInstance?.aceptado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inscripcionInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="inscripcion.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${escuelaingles.Alumno.list()}" optionKey="id" required="" value="${inscripcionInstance?.alumno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inscripcionInstance, field: 'profesor', 'error')} required">
	<label for="profesor">
		<g:message code="inscripcion.profesor.label" default="Profesor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesor" name="profesor.id" from="${escuelaingles.Profesor.list()}" optionKey="id" required="" value="${inscripcionInstance?.profesor?.id}" class="many-to-one"/>
</div>

