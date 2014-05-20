package escuelaingles

class SesController {
    
    def index() { 
    }
    
    def opcionProfesorAlumno() {
    
    }
    
    def accesoDenegado() {
    
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
            redirect controller: "Alumno",action: "interfazAlumno"
            }else{
            encontrado = Profesor.findWhere(correo:params['correo'],contrasena:params['contrasena'])
            if(encontrado && encontrado.correo!="noreply.clickbeh@gmail.com"){
                session.user = encontrado
                redirect controller: "Profesor",action: "interfazProfesor"
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
