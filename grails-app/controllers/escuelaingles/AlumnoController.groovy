package escuelaingles



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AlumnoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Alumno.list(params), model:[alumnoInstanceCount: Alumno.count()]
    }

    def show(Alumno alumnoInstance) {
         session.user = alumnoInstance
         flash.message="Tu cuenta se ha registrado exitosamente"
        redirect controller: "profesor", action: "verCursosAlumno"
    }

    def create() {
        respond new Alumno(params)
    }
    
    def interfazAlumno(){}
    
    def consultarCalifacacion(){}
    

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
                flash.message = message(code: 'default.created.message', args: [message(code: 'alumnoInstance.label', default: 'Alumno'), alumnoInstance.id])
                redirect alumnoInstance
            }
            '*' { respond alumnoInstance, [status: CREATED] }
        }
    }

    def edit(Alumno alumnoInstance) {
        respond alumnoInstance
    }

    @Transactional
    def update(Alumno alumnoInstance) {
        if (alumnoInstance == null) {
            notFound()
            return
        }

        if (alumnoInstance.hasErrors()) {
            respond alumnoInstance.errors, view:'manejoCuentaAlumno'
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

    def actualizarDatos(){
        redirect action: "opcionProfesorAlumno"
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
