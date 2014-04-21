package escuelaingles


class Alumno {
    String nombre
    String apellp
    String apellm
    String contrasena
    String confContrasena
    String correo
    String telefono
    
    static hasMany=[inscripciones:Inscripcion]

    static constraints = {
        correo (blank : false, unique: true, email:true)
        nombre blank : false
        apellp blank : false
        apellm blank : false
        contrasena blank: false
        confContrasena (validator: { val, obj ->
            if (val != obj.properties['contrasena']) return 'contrasena.missmatch'})
        telefono (blank : false, validator:{val, obj ->
            if (val.length() != 8) return 'telefono.missmatch'})
        
    }
    String toString(){
        return nombre+" "+apellp+" "+apellm
    }
}
