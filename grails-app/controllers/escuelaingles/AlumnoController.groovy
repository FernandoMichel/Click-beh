package escuelaingles



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AlumnoController {
def accessService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        redirect controller: "alumno", action: "interfazAlumno"
    }

    def show(Alumno alumnoInstance) {
        redirect controller: "alumno", action: "interfazAlumno"
    }

    def create() {
        respond new Alumno(params)
    }
    
    def interfazAlumno(){
        if (!accessService.acceso(session.user, 2)){
            redirect controller: "ses", action:"accesoDenegado"
        }
    }
    

    @Transactional
    def save(Alumno alumnoInstance) {
        if (alumnoInstance == null) {
            notFound()
            return
        }

        if (alumnoInstance.hasErrors()) {
            respond alumnoInstance.errors, view:'create'
            return
        }

        alumnoInstance.save flush:true

        request.withFormat {
            form {
                
                session.user = alumnoInstance
                flash.message="Tu cuenta se ha registrado exitosamente"
                redirect action: "interfazAlumno"
            }
            '*' { respond alumnoInstance, [status: CREATED] }
        }
    }

    def edit(Alumno alumnoInstance) {
        if (!accessService.acceso(session.user, 2)){
            redirect controller: "ses", action:"accesoDenegado"
        }
        respond alumnoInstance
    }

    @Transactional
    def update(Alumno alumnoInstance) {
        if (alumnoInstance == null) {
            notFound()
            return
        }

        if (alumnoInstance.hasErrors()) {
            respond alumnoInstance.errors, view:'edit'
            return
        }

        alumnoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Alumno.label', default: 'Alumno'), alumnoInstance.id])
                redirect alumnoInstance
            }
            '*'{ respond alumnoInstance, [status: OK] }
        }
    }
    
    @Transactional
    def delete(Alumno alumnoInstance) {

        if (alumnoInstance == null) {
            notFound()
            return
        }

        alumnoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Alumno.label', default: 'Alumno'), alumnoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'alumnoInstance.label', default: 'Alumno'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
