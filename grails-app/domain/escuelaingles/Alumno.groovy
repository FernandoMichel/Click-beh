package escuelaingles


class Alumno {
    String nombre
    String apellp
    String apellm
    String contrasena
    String correo
    String telefono
    

    static constraints = {
        correo blank : false
        nombre blank : false
        apellp blank : false
        apellm blank : false
        contrasena blank : false
        correo blank : false
        correo unique : true
        telefono blank : false
        
    }
}
