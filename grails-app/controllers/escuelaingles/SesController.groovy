package escuelaingles

class SesController {

    def index() { 
    }
    
    //Inicia cualquiera tanto profesor y alumno y posiblemente admin
    def iniciarUsuario(){
         def encontrado = user.findWhere(correo:params['correo'],contrasena:params['contrasena'])
         session.user = encontrado
        if (encontrado){
            redirect controller: "Profesor",action: "verCursosAlumno"
        }else{
            redirect action: "index"        
        }
        
    }
    
    def iniciarSesion(){
        redirect action: "index"
    }
    
    
}
