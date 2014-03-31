package escuelaingles

class Profesor {
    String nombre
    String apellp
    String apellm
    String contrasena
    String correo
    
    

    static constraints = {
        correo blank : false
        nombre blank : false
        apellp blank : false
        apellm blank : false
        contrasena blank : false
        correo blank : false
        correo unique : true
        
    }
}
