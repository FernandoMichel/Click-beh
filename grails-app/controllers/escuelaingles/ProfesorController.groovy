package escuelaingles

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional(readOnly = true)
class ProfesorController {
def fileUploadService
def mailService
def accessService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    

    def index(Integer max) {
        redirect action:"interfazProfesor"
    }

    def verCursosVisitante(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Profesor.list(params), model:[profesorInstanceCount: Profesor.count()]
    }

    def verCursosAlumno(Integer max) {
        if (accessService.acceso(session.user, 2)){
            params.max = Math.min(max ?: 10, 100)
            respond Profesor.list(params), model:[profesorInstanceCount: Profesor.count()]
        }else{
            redirect controller: "ses", action:"accesoDenegado"
        }
    }

    def verificarDatosProfesor(Integer max) {
        if (accessService.acceso(session.user, 1)){
            params.max = Math.min(max ?: 10, 100)
            respond Profesor.list(params), model:[profesorInstanceCount: Profesor.count()]
        }else{
            redirect controller: "ses", action:"accesoDenegado"
        }
    }
    
    def interfazProfesor(){
        if (!accessService.acceso(session.user, 3)){
            redirect controller: "ses", action:"accesoDenegado"
        }else{
            if (!session.user.aceptado){
                redirect action:"solicitudEnProceso"
            }
        }
    }

    def show(Profesor profesorInstance) {
        if (accessService.acceso(session.user, 3)){
            session.user = profesorInstance
            flash.message="Tus datos se han actualizado exitosamente"
            redirect controller: "profesor", action: "interfazProfesor"
        }else{
            redirect controller:"ses", action:"accesoDenegado"
        }
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
           session.user = profesorInstance
           flash.message="Tu cuenta se ha registrado exitosamente"
           redirect action: "solicitudEnProceso"
        }else{
            respond profesorInstance, [status: CREATED]
        }
    }

    def edit(Profesor profesorInstance) {
        if (!accessService.acceso(session.user, 3)){
            redirect controller:"ses", action:"accesoDenegado"
        }
        respond profesorInstance
    }

    @Transactional
    def update(Profesor profesorInstance) {
        if (profesorInstance == null) {
            notFound()
            return
        }

        if (profesorInstance.hasErrors()) {
            respond profesorInstance.errors, view:'manejoCuentaProfesor'
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
            aceptado: false,
            nivel: profesorInstance.nivel
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
        mailService.sendMail{
            to profesorInstance.correo
            from "noreply.clickbeh@gmail.com"
            subject "Postulacion para profesor de ingles, rechazada"
            html """
            some text here """
        }
        profesorInstance.delete flush:true
        flash.message="Se ha rechazado el registro del profesor ${profesorInstance}"
        redirect action:"verificarDatosProfesor"
    }
   
    @Transactional
    def aceptar(Profesor profesorInstance) {
        mailService.sendMail{
            to profesorInstance.correo
            from "noreply.clickbeh@gmail.com"
            subject "Postulacion para profesor de ingles, aceptada"
            html """
            some text here """
        }
        profesorInstance.aceptado=true
        profesorInstance.save flush:true
        flash.message="Se ha aceptado el registro del profesor ${profesorInstance}"
        redirect action:"verificarDatosProfesor"
    }
    
    def solicitudEnProceso(){}
def certificado(Profesor profesorInstance){
    
}

    @Transactional
    def eliminar(){
        def prof=Profesor.findWhere(correo:"noreply.clickbeh@gmail.com")
        def inscrips=Inscripcion.findWhere(profesor:session.user)
        inscrips.each{
            it.profesor=prof
            it.save()
        } 
        session.user.delete()
        session.user=null
        flash.message="Cuenta eliminada"
        redirect uri:" "
    }
}
