package escuelaingles

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional(readOnly = true)
class ProfesorController {
def fileUploadService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Profesor.list(params), model:[profesorInstanceCount: Profesor.count()]
    }

    def verCursosVisitante(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Profesor.list(params), model:[profesorInstanceCount: Profesor.count()]
    }

    def verCursosAlumno(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Profesor.list(params), model:[profesorInstanceCount: Profesor.count()]
    }

    def verificarDatosProfesor(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Profesor.list(params), model:[profesorInstanceCount: Profesor.count()]
    }
    
    def entrarSistema(String correo, String contrasena){
        
    }

    def show(Profesor profesorInstance) {
        session.user = profesorInstance
         flash.message="Tu cuenta se ha registrado exitosamente"
        redirect controller: "inscripcion", action: "solicitudesDeInscripcion"
    }

    def create() {
        respond new Profesor(params)
    }

    @Transactional
    def save(Profesor profesorInstance) {
        if (profesorInstance == null) {
            notFound()
            return
        }

        if (profesorInstance.hasErrors()) {
            respond profesorInstance.errors, view:'create'
            return
        }

        
        CommonsMultipartFile file = request.getFile('certificado')
        CommonsMultipartFile file2 = request.getFile('video')       
        if( file.empty || file2.empty){
         flash.error = "No se selecciono un archivo"        
         respond profesorInstance, view : 'create'   
         return
        }
        def dirArchivo = "files/"
        String baseFileName = "certificado_"+profesorInstance.correo
        String baseFileName2 = "video_"+profesorInstance.correo
        def downloadedFile = request.getFile( "certificado" )
        def downloadedFile2 = request.getFile( "video" )
        String mimeType = downloadedFile.contentType
        String extension = mimeType.substring(mimeType.lastIndexOf('/') + 1)
        mimeType = downloadedFile2.contentType
        String extension2 = mimeType.substring(mimeType.lastIndexOf('/') + 1)
        String fileUploaded = fileUploadService.uploadFile( downloadedFile, baseFileName+"."+extension, dirArchivo )
        String fileUploaded2 = fileUploadService.uploadFile( downloadedFile2, baseFileName2+"."+extension2, dirArchivo )
        if( fileUploaded && fileUploaded2){
           profesorInstance.dirCertificado = "${baseFileName}"+"."+extension
           profesorInstance.dirVideo = "${baseFileName2}"+"."+extension2
           profesorInstance.save flush:true
           flash.message = message(code: 'default.created.message', args: [message(code: 'Profesor.label', default: 'Profesor'), profesorInstance.id])
           redirect profesorInstance
        }
        else
        {
            respond profesorInstance, [status: CREATED]
        }        
    }

    def edit(Profesor profesorInstance) {
        respond profesorInstance
    }

    @Transactional
    def update(Profesor profesorInstance) {
        if (profesorInstance == null) {
            notFound()
            return
        }

        if (profesorInstance.hasErrors()) {
            respond profesorInstance.errors, view:'edit'
            return
        }

        profesorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Profesor.label', default: 'Profesor'), profesorInstance.id])
                redirect profesorInstance
            }
            '*'{ respond profesorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Profesor profesorInstance) {

        if (profesorInstance == null) {
            notFound()
            return
        }

        profesorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Profesor.label', default: 'Profesor'), profesorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesorInstance.label', default: 'Profesor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    @Transactional
    def inscribir(Profesor profesorInstance){
            Inscripcion inscrip=new Inscripcion(
            alumno: session.user, //se asume que si un usuario esta intentando una inscripcion, entonces ha iniciado sesion como alumno
            profesor: profesorInstance,
            aceptado: false
        )
        inscrip.save flush:true
        if(inscrip.hasErrors()){
            println inscrip.errors
        }
        flash.message="Se ha enviado una solicitud de inscripcion al profesor ${profesorInstance}, en breve se pondrá en contacto contigo"
        redirect action:"verCursosAlumno"
    }
   
    @Transactional
    def rechazar(Profesor profesorInstance) {
        profesorInstance.delete flush:true
        flash.message="Se ha rechazado el registro del profesor ${profesorInstance}"
        redirect action:"verificarDatosProfesor"
    }
   
    @Transactional
    def aceptar(Profesor profesorInstance) {
        profesorInstance.aceptado=true
        profesorInstance.save flush:true
        flash.message="Se ha aceptado el registro del profesor ${profesorInstance}"
        redirect action:"verificarDatosProfesor"
    }
}
