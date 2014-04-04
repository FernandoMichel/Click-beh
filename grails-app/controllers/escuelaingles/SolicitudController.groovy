package escuelaingles



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SolicitudController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Solicitud.list(params), model:[solicitudInstanceCount: Solicitud.count()]
    }

    def show(Solicitud solicitudInstance) {
        respond solicitudInstance
    }

    def create() {
        respond new Solicitud(params)
    }

    @Transactional
    def save(Solicitud solicitudInstance) {
        if (solicitudInstance == null) {
            notFound()
            return
        }

        if (solicitudInstance.hasErrors()) {
            respond solicitudInstance.errors, view:'create'
            return
        }

        solicitudInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitudInstance.label', default: 'Solicitud'), solicitudInstance.id])
                redirect solicitudInstance
            }
            '*' { respond solicitudInstance, [status: CREATED] }
        }
    }

    def edit(Solicitud solicitudInstance) {
        respond solicitudInstance
    }

    @Transactional
    def update(Solicitud solicitudInstance) {
        if (solicitudInstance == null) {
            notFound()
            return
        }

        if (solicitudInstance.hasErrors()) {
            respond solicitudInstance.errors, view:'edit'
            return
        }

        solicitudInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Solicitud.label', default: 'Solicitud'), solicitudInstance.id])
                redirect solicitudInstance
            }
            '*'{ respond solicitudInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Solicitud solicitudInstance) {

        if (solicitudInstance == null) {
            notFound()
            return
        }

        solicitudInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Solicitud.label', default: 'Solicitud'), solicitudInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitudInstance.label', default: 'Solicitud'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
