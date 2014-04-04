package escuelaingles

class Curso {
    String nivel
    String horario
    
    Object video

    static hasMany=[inscripciones:Inscripcion]
    static belongsTo=[profesor:Profesor]
    static constraints = {
        nivel blank: false 
        nivel inList: ["Principiante","Intermedio","Avanzado","Conversacion"]
        horario blank: false
        video blank: true
    }
}
