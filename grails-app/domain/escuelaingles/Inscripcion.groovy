package escuelaingles

class Inscripcion {
    boolean aceptado
    static belongsTo=[alumno:Alumno, profesor:Profesor]
        
    static constraints = {
    }
}
