package escuelaingles

class SesController {
    
    def index() { 
    }
    
    //Inicia cualquiera tanto profesor y alumno y posiblemente admin
    def iniciarUsuario(){
        print "Entro al metodo"
         def encontrado = Alumno.findWhere(correo:params['correo'],contrasena:params['contrasena'])
         print (params['correo'] )
         print (params ['contrasena'])
         session.user = encontrado
        if (encontrado){
            print "entonctro alumno"
            redirect controller: "Profesor",action: "verCursosAlumno"
        }else{
            print "busca profesor"
            encontrado = Profesor.findWhere(correo:params['correo'],contrasena:params['contrasena'])
            session.user = encontrado
            if(encontrado){
                print "encontro profesor"
                redirect controller: "Inscripcion",action: "solicitudesDeInscripcion"
            }else{
                if(params['correo'] == "admin" && params['contrasena'] == "admin"){
                    redirect controller: "Profesor", action: "verificarDatosProfesor"
                }else{
                    print "nada encontrado"
                    redirect action: "index"
                }
            }
        }
        
    }
    
    def iniciarSesion(){
        redirect action: "index"
    }
    
    
}
