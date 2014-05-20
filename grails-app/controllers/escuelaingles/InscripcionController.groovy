package escuelaingles

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InscripcionController {
def accessService
def mailService
def pdfRenderingService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        redirect controller: "ses", action "accesoDenegado"
    }
    def solicitudesDeInscripcion(Integer max) {
        if (accessService.acceso(session.user, 3)){
            if (session.user.aceptado){
                params.max = Math.min(max ?: 10, 100)
                respond Inscripcion.list(params), model:[inscripcionInstanceCount: Inscripcion.count()]
            }else{
                redirect controller:"profesor", action: "interfazProfesor"
            }
        }else{
            redirect controller: "ses", action: "accesoDenegado"
        }
    }
 
    def consultarCalificacion(Integer max) {
        if (accessService.acceso(session.user, 2)){
            params.max = Math.min(max ?: 10, 100)
            respond Inscripcion.list(params), model:[inscripcionInstanceCount: Inscripcion.count()]
        }else{
            redirect controller: "ses", action: "accesoDenegado"
        }
    }
 
    def calificar(Integer max) {
        if (accessService.acceso(session.user, 3)){
            if (session.user.aceptado){
                params.max = Math.min(max ?: 10, 100)
                respond Inscripcion.list(params), model:[inscripcionInstanceCount: Inscripcion.count()]
            }else{
                redirect controller:"profesor", action: "interfazProfesor"
            }
        }else{
            redirect controller: "ses", action: "accesoDenegado"
        }
    }
    
    def show(Inscripcion inscripcionInstance) {
        redirect controller: "ses", action "accesoDenegado"
    }

    def create() {
        redirect controller: "ses", action "accesoDenegado"
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
        redirect controller: "ses", action "accesoDenegado"
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
        mailService.sendMail{
            to inscripcionInstance.alumno.correo
            from "noreply.clickbeh@gmail.com"
            subject "Tu solicitud de inscripción ha sido rechazada"
            html """
El profesor ${inscripcionInstance.profesor} ha <storng><font color="red">rechazado</font> tu solicitud de inscripci&oacute;n</strong> al curso de inglés nivel ${inscripcionInstance.nivel} con horario ${inscripcionInstance.profesor.horario}.
"""
        }
        inscripcionInstance.delete flush:true
        flash.message="Se ha rechazado la inscripcion del alumno ${inscripcionInstance.alumno}"
        redirect action:"solicitudesDeInscripcion"
    }
   
    @Transactional
    def aceptar(Inscripcion inscripcionInstance) {
        inscripcionInstance.aceptado=true
        inscripcionInstance.calificacion=-1
        mailService.sendMail{
            to inscripcionInstance.alumno.correo
            from "noreply.clickbeh@gmail.com"
            subject "Escuela de idiomas - Tu solicitud de inscripción ha sido aceptada"
            html """<strong>Se te a <font color="green">aceptado</font> en el curso</strong> de 
ingl&eacute;s nivel ${inscripcionInstance.nivel} con horario ${inscripcionInstance.profesor.horario} del profesor ${inscripcionInstance.profesor}.
"""
        }
        flash.message="Se ha aceptado la inscripcion del alumno ${inscripcionInstance.alumno}"
        redirect action:"solicitudesDeInscripcion"
    }
   
    @Transactional
    def asignarCalif(Inscripcion inscripcionInstance){
        int cal=params['calificacion'] as int
        inscripcionInstance.calificacion= cal
        inscripcionInstance.save flush:true
        flash.message="Se ha asignado la calificación al alumno ${inscripcionInstance.alumno}"
        if (cal>5){
            def directorio=servletContext.getRealPath("files/")
            String nombreArch="/constancia_${inscripcionInstance.alumno.correo}_${inscripcionInstance.profesor.correo}.pdf"
            File arch=new File(directorio+nombreArch)
            print arch
            arch.createNewFile()
            pdfRenderingService.render([template: "/constancia", model: [insc: inscripcionInstance]], arch.newOutputStream())
        inscripcionInstance.dirConstancia= nombreArch
        inscripcionInstance.save flush:true
        }
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