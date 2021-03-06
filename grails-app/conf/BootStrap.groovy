import escuelaingles.*
class BootStrap {

    def init = { servletContext ->
        
        def fantasma=new Profesor(
        nombre:"este profesor",
        apellp:" ya no labora",
        apellm:" con nosotros",
        contrasena:"pass",
        confContrasena:"pass",
        correo:"noreply.clickbeh@gmail.com",
        nivel:"Principiante",
        horario:"matutino",
        aceptado:false,
        dirCertificado:" ",
        dirVideo:" "
        )
        fantasma.save()
        if(fantasma.hasErrors()){
            println fantasma.errors
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
        dirCertificado:"certificado_daniel_michel@ciencias.unam.mx.pdf",
        dirVideo:"video_daniel_michel@ciencias.unam.mx.mp4"
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
            aceptado: false,
            nivel: "Principiante"
        )
        inscPrueba.save()
        if(inscPrueba.hasErrors()){
            println inscPrueba.errors
        }
    }
    def destroy = {
    }
}
