package escuelaingles

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InscripcionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inscripcion.list(params), model:[inscripcionInstanceCount: Inscripcion.count()]
    }
    def solicitudesDeInscripcion(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inscripcion.list(params), model:[inscripcionInstanceCount: Inscripcion.count()]
    }
 
    def consultarCalificacion(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inscripcion.list(params), model:[inscripcionInstanceCount: Inscripcion.count()]
    }
 
    def calificar(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inscripcion.list(params), model:[inscripcionInstanceCount: Inscripcion.count()]
    }
    
    def show(Inscripcion inscripcionInstance) {
        respond inscripcionInstance
    }

    def create() {
        respond new Inscripcion(params)
    }

    @Transactional
    def save(Inscripcion inscripcionInstance) {
        if (inscripcionInstance == null) {
            notFound()
            return
        }

        if (inscripcionInstance.hasErrors()) {
            respond inscripcionInstance.errors, view:'create'
            return
        }

        inscripcionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'inscripcionInstance.label', default: 'Inscripcion'), inscripcionInstance.id])
                redirect inscripcionInstance
            }
            '*' { respond inscripcionInstance, [status: CREATED] }
        }
    }

    def edit(Inscripcion inscripcionInstance) {
        respond inscripcionInstance
    }

    @Transactional
    def update(Inscripcion inscripcionInstance) {
        if (inscripcionInstance == null) {
            notFound()
            return
        }

        if (inscripcionInstance.hasErrors()) {
            respond inscripcionInstance.errors, view:'edit'
            return
        }

        inscripcionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Inscripcion.label', default: 'Inscripcion'), inscripcionInstance.id])
                redirect inscripcionInstance
            }
            '*'{ respond inscripcionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Inscripcion inscripcionInstance) {

        if (inscripcionInstance == null) {
            notFound()
            return
        }

        inscripcionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Inscripcion.label', default: 'Inscripcion'), inscripcionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
   
    @Transactional
    def rechazar(Inscripcion inscripcionInstance) {
        inscripcionInstance.delete flush:true
        flash.message="Se ha rechazado la inscripcion del alumno ${inscripcionInstance.alumno}"
        redirect action:"solicitudesDeInscripcion"
    }
   
    @Transactional
    def aceptar(Inscripcion inscripcionInstance) {
        inscripcionInstance.aceptado=true
        inscripcionInstance.calificacion=-1
        inscripcionInstance.save flush:true
        flash.message="Se ha aceptado la inscripcion del alumno ${inscripcionInstance.alumno}"
        redirect action:"solicitudesDeInscripcion"
    }
   
    @Transactional
    def asignarCalif(Inscripcion inscripcionInstance){
        inscripcionInstance.calificacion= params['calificacion'] as int
        inscripcionInstance.save flush:true
        flash.message="Se ha asignado la calificación al alumno ${inscripcionInstance.alumno}"
        redirect action:"calificar"
    }
    
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'inscripcionInstance.label', default: 'Inscripcion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
