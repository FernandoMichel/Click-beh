package escuelaingles

class SesController {
    
    def index() { 
    }
    def opcionProfesorAlumno() {
    
    }
    def logout(){
        session.user=null
        redirect(uri: " ")
    }
    
    //Inicia cualquiera tanto profesor y alumno y posiblemente admin
    def iniciarUsuario(){
         def encontrado = Alumno.findWhere(correo:params['correo'],contrasena:params['contrasena'])
        if (encontrado){
            session.user = encontrado
        
            redirect controller: "Profesor",action: "verCursosAlumno"
        
            }else{
            encontrado = Profesor.findWhere(correo:params['correo'],contrasena:params['contrasena'])
            if(encontrado){
                session.user = encontrado
                redirect controller: "Inscripcion",action: "solicitudesDeInscripcion"
            }else{
                if(params['correo'] == "admin" && params['contrasena'] == "admin"){
                    session.user="Administrador"
                    redirect controller: "Profesor", action: "verificarDatosProfesor"
                }else{
                    redirect action: "index"
                }
            }
        }
        
    }
    def irAOpcion(){
        redirect action: "opcionProfesorAlumno"
    }
    def iniciarSesion(){
        redirect action: "index"
    }
    
    
}
