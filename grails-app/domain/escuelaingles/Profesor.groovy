package escuelaingles

class Profesor {
    String nombre
    String apellp
    String apellm
    String contrasena
    String confContrasena
    String correo
    
    Object certificado
    String nivel
    String horario
    Object video
    
    boolean aceptado

    static constraints = {
        correo (blank : false, unique: true, email: true)
        nombre blank : false
        apellp blank : false
        apellm blank : false
        contrasena blank : false
        confContrasena (validator: { val, obj ->
            if (val != obj.properties['contrasena']) return 'contrasena.missmatch'})
        certificado blank : true
        nivel (blank: false , inList: ["Principiante","Intermedio","Avanzado","Conversacion"])
        horario blank: false
        video blank: true
        
    }
    
    String toString(){
        return nombre+" "+apellp+" "+apellm
    }
}
