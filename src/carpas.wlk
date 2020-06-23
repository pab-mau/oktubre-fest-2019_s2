import marcasYCervezas.*
import personas.*

class Carpa {
	
	var property limiteGente
    var property tieneMusica
    var property vendeCervezaMarca
    var property cantidadPersonas = 0
    var personasEnLaCarpa = []
    
    
	method dejaIngresar(unaPersona) {
		
		
		
		return cantidadPersonas < self.limiteGente() and  not unaPersona.estaEbrie()
	}
	
	method ingresar(unaPersona) {
		
		cantidadPersonas +=1
		personasEnLaCarpa.add(unaPersona)
	}
	
	method contieneA(unaPersona) { return personasEnLaCarpa.contains(unaPersona)}
	
	
    method servirA(unaPersona)  {
    	
    	const jarraNueva = new Jarra(capacidad=1, marca = vendeCervezaMarca)
    	
    	if(self.contieneA(unaPersona)){
    		
    		unaPersona.jarrasCompradas().add(jarraNueva)
    	}
    	
    	else { self.error("se fue")}
    	
    }
    
    
    method ebriosEmperdernidos() {
    	
    	return personasEnLaCarpa.count({per=>per.estaEmpedernido()})
    }	 
	
}
