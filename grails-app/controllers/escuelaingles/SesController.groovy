package escuelaingles

class SesController {

    def index() { 
    }
    
    
    def iniciar(){
         def encontrado = Alumno.findWhere(correo:params['correo'],contrasena:params['contrasena'])
         session.user = encontrado
        if (encontrado){
            redirect controller: "Profesor",action: "verCursosAlumno"
        }else{
            redirect action: "index"        
        }
        
    }
    
}
