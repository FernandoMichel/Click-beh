package escuelaingles

class SesionController {

    def index() { 
        
    }
    
    def iniciarSesionAlumno(String correo, String contrasena){
        Alumno encontrado = Alumno.executeQuery ("select * where Alumno.correo = correo and Alumno.contrasena\n\
= contrasena")
        if (encontrado){
            session.user = encontrado
            redirect controller: "Profesor",action: "verCursosAlumno"
        }
   
    }
    
}
