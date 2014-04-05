package escuelaingles

class Inscripcion {
    
    static belongsTo=[alumno:Alumno, profesor:Profesor]
        
    static constraints = {
    }
}
