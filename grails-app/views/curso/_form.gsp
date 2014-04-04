<%@ page import="escuelaingles.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="curso.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nivel" from="${cursoInstance.constraints.nivel.inList}" required="" value="${cursoInstance?.nivel}" valueMessagePrefix="curso.nivel"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'horario', 'error')} required">
	<label for="horario">
		<g:message code="curso.horario.label" default="Horario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="horario" required="" value="${cursoInstance?.horario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'aceptado', 'error')} ">
	<label for="aceptado">
		<g:message code="curso.aceptado.label" default="Aceptado" />
		
	</label>
	<g:checkBox name="aceptado" value="${cursoInstance?.aceptado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'inscripciones', 'error')} ">
	<label for="inscripciones">
		<g:message code="curso.inscripciones.label" default="Inscripciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cursoInstance?.inscripciones?}" var="i">
    <li><g:link controller="inscripcion" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="inscripcion" action="create" params="['curso.id': cursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'inscripcion.label', default: 'Inscripcion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'profesor', 'error')} required">
	<label for="profesor">
		<g:message code="curso.profesor.label" default="Profesor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesor" name="profesor.id" from="${escuelaingles.Profesor.list()}" optionKey="id" required="" value="${cursoInstance?.profesor?.id}" class="many-to-one"/>
</div>

