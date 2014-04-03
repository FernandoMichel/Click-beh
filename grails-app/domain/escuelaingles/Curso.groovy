package escuelaingles

class Curso {
    String nivel
    String horario

    static hasMany=[inscripciones:Inscripcion]
    static belongsTo=[profesor:Profesor]
    static constraints = {
        nivel (blank: false, inList ("Principiante","Intermedio","Avanzado","Conversacion"))
        horario blank: false
    }
}
