package escuelaingles

class Inscripcion {
    boolean aceptado
    int calificacion
    String dirConstancia
    static belongsTo=[alumno:Alumno, profesor:Profesor]
    String nivel;
        
    static constraints = {
        calificacion nullable:true
        dirConstancia nullable:true
    }
}
