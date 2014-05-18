package escuelaingles

import grails.transaction.Transactional

@Transactional
class AccessService {
    
    def boolean acceso(Object user, int tipo){
        if (user==null){
            if (tipo==0)
                return true
            else
                return false
        }else{
            if (user=="Administrador"){
                if (tipo==1)
                    return true
                else
                    return false
            }else{
                if (user.instanceOf(Alumno)){
                    if (tipo==2)
                        return true
                    else
                        return false                    
                }else{
                    if (user.instanceOf(Profesor)){
                        if (tipo==3)
                            return true
                        else
                            return false 
                    }else{
                        return false
                    }
                }
            }
        }
    }
}
