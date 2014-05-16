import escuelaingles.*
class BootStrap {
    
    def mailService
    

    def init = { servletContext ->
        
        
        
        mailService.sendMail{
        to "jona_54_.com@ciencias.unam.mx"
        subject "New Account"
        html """
        Your <strong>new</strong> account is set up.  
        Your username is: """
        }   
        
        
        
        def profePrueba=new Profesor(
        nombre:"Profe",
        apellp:"de",
        apellm:"prueba",
        contrasena:"pass",
        confContrasena:"pass",
        correo:"daniel_michel@ciencias.unam.mx",
        nivel:"Principiante",
        horario:"matutino",
        aceptado:true,
        dirCertificado:"certificado_prof@gmail.com.pdf",
        dirVideo:"video_prof@gmail.com.x-ms-wmv.mp4"
        )
        profePrueba.save()
        if(profePrueba.hasErrors()){
            println profePrueba.errors
        }
        def alumnoPrueba=new Alumno(
        nombre:"Alumno",
        apellp:"de",
        apellm:"prueba",
        contrasena:"pass",
        confContrasena:"pass",
        correo:"fernando_michel@ciencias.unam.mx",
        telefono:"12345678"
        )
        alumnoPrueba.save()
        if(alumnoPrueba.hasErrors()){
            println alumnoPrueba.errors
        }
        def inscPrueba=new Inscripcion(
            alumno: alumnoPrueba,
            profesor: profePrueba,
            aceptado: false
        )
        inscPrueba.save()
        if(inscPrueba.hasErrors()){
            println inscPrueba.errors
        }
    }
    def destroy = {
    }
}
