package escuelaingles

class Inscripcion {
    
    static belongsTo=[curso:Curso, alumno:Alumno]

    static constraints = {
    }
}
