<%@ page import="escuelaingles.Inscripcion" %>



<div class="fieldcontain ${hasErrors(bean: inscripcionInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="inscripcion.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${escuelaingles.Alumno.list()}" optionKey="id" required="" value="${inscripcionInstance?.alumno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inscripcionInstance, field: 'curso', 'error')} required">
	<label for="curso">
		<g:message code="inscripcion.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="curso" name="curso.id" from="${escuelaingles.Curso.list()}" optionKey="id" required="" value="${inscripcionInstance?.curso?.id}" class="many-to-one"/>
</div>

