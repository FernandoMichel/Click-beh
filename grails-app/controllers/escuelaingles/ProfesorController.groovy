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
            alumno: session.user, 
            profesor: profesorInstance,
            aceptado: false,
            nivel: profesorInstance.nivel
        )
        inscrip.save flush:true
        if(inscrip.hasErrors()){
            println inscrip.errors
        }
        mailService.sendMail{
        to profesorInstance.correo
        from "noreply.clickbeh@gmail.com"
        subject "Escuela de idiomas - Solicitud de insripción"
        html """Profesor ${profesorInstance}
Tenemos el gusto de informarle que el alumno ${session.user} ha solicitado
inscribirse a su curso de ingl&eacute;s nivel ${profesorInstance.nivel} con horario ${profesorInstance.horario}<p/>
<strong>Para <font color="green">aceptar</font> o
<font color="red">rechazar</font> al estudiante</strong>; inicie sesi&oacute;n
con su usuario en el sitio y valla a <i>incripciones</i>
"""
        }
        flash.message="Se ha enviado una solicitud de inscripcion al profesor ${profesorInstance}, en breve se pondrá en contacto contigo"
        redirect action:"verCursosAlumno"
    }
   
    @Transactional
    def rechazar(Profesor profesorInstance) {
        mailService.sendMail{
            to profesorInstance.correo
            from "noreply.clickbeh@gmail.com"
            subject "Escuela de idiomas - Tu solicitud de incorporación como profesor ha sido rechazada"
            html """Le informamos que los administradores de la escuela han determinado que
<strong>su petici&oacute;n de incorporaci&oacute;n como profesor debe ser
rechazada.</strong> Esto puede deberse a que ha escogido un nivel con
sobrepoblaci&oacute;n de profesores, le recomendamos escoger un nivel menor de
ser posible. Si en alg&uacute;n momento su solicitud le es &uacute;til a la
escuela le llamaremos.<font color="white">ingenuo...</font>"""
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
            subject "Escuela de idiomas - ¡Has sido aceptado como profesor!"
            html """La escuela te da una cordial bienvenida al <i>incorporarte a su grupo de
selectos profesores.</i> <strong>A partir de ahora; tu curso ser&aacute;
visible para alumnos y visitantes a trav&eacute;s del portal web.</strong>
Cuando un alumno desee tomar tu curso, te llegar&aacute; un correo
electr&oacute;nico para que tomes la decisi&oacute;n de aceptarlo o rechazarlo.
&#xa1;Enhorabuena!"""
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
