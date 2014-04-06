import escuelaingles.*
class BootStrap {

    def init = { servletContext ->
        def profePrueba=new Profesor(
        nombre:"Profe",
        apellp:"de",
        apellm:"prueba",
        contrasena:"pass",
        correo:"daniel_michel@ciencias.unam.mx",
        nivel:"Principiante",
        horario:"matutino",
        aceptado:true
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
        correo:"fernando_michel@ciencias.unam.mx",
        telefono:"telefono"
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
