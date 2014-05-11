package escuelaingles

class Profesor {
    String nombre
    String apellp
    String apellm
    String contrasena
    String confContrasena
    String correo
    
    String dirCertificado
    String nivel
    String horario
    String dirVideo
    
    boolean aceptado

    static constraints = {
        correo (blank : false, unique: true, email: true)
        nombre blank : false
        apellp blank : false
        apellm blank : false
        contrasena blank : false
        confContrasena (validator: { val, obj -> if (val != obj.properties['contrasena']) return 'contrasena.missmatch'})
        nivel (blank: false , inList: ["Principiante","Intermedio","Avanzado","Conversacion"])
        horario blank : false
        dirCertificado nullable: true
        dirVideo nullable: true
        
    }
    
    String toString(){
        return nombre+" "+apellp+" "+apellm
    }
}
