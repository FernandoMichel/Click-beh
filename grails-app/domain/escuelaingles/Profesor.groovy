package escuelaingles

class Profesor {
    String nombre
    String apellp
    String apellm
    String contrasena
    String correo
    
    Object certificado
    String nivel
    String horario
    Object video
    
    boolean aceptado

    static constraints = {
        correo blank : false
        nombre blank : false
        apellp blank : false
        apellm blank : false
        contrasena blank : false
        correo blank : false
        correo unique : true
        certificado blank : true
        nivel blank: false 
        nivel inList: ["Principiante","Intermedio","Avanzado","Conversacion"]
        horario blank: false
        video blank: true
    }
}
