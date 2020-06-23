import marcasYCervezas.*
import carpas.*


class PersonaBelga {
	
	var property peso
	var property jarrasCompradas = []
	var property escuchaMTradicional = true
	var property nivelDeAguante
	
	
	
    method alcoholTotal() {
    	
    	return jarrasCompradas.sum({jarra=>jarra.cantidadAlcohol()})
    }
	
	method estaEbrie() {
		
		return self.alcoholTotal() * peso > nivelDeAguante
	}
	
	method leGusta (marca) { return marca.contenidoLupulo() > 4  }
	
	
	
	method leGustaMusica(unaCarpa) { 
		
		return (self.escuchaMTradicional() and unaCarpa.tieneMusica())  or 
		 (not self.escuchaMTradicional() and not unaCarpa.tieneMusica())
		        
	}

	method quiereEntrar(unaCarpa) {
		
		return self.leGusta(unaCarpa.vendeCervezaMarca()) and self.leGustaMusica(unaCarpa)
	}
	
	method puedeEntrar(unaCarpa) {
		
		return self.quiereEntrar(unaCarpa) and unaCarpa.dejaIngresar(self)
		
	}
	
	method entrar(unaCarpa) {
		
	    if (self.puedeEntrar(unaCarpa)) {
	    	
	    	unaCarpa.ingresar(self)
	    }
	    
	    else { self.error("no puede entrar señor/a")}
}

    method comproJarrasGrandes() {
    	
    	return self.jarrasCompradas().all({jarra=>jarra.capacidad() >= 1})
    }
    
    method estaEmpedernido() { 
    	
    	return self.comproJarrasGrandes() and self.estaEbrie()
    }
    
    method esPatriota () {
    	
    	
    	
    }

	
}

class PersonaCheca inherits PersonaBelga {
	
	override method leGusta(marca) { return marca.graduacion() > 8}
}

class PersonaAlemana inherits PersonaBelga {
	 
	 var property marcaQueLeGustan = []
	 
	override method leGusta(marca) { 
		
		return marcaQueLeGustan.contains(marca)
	}
	
	override method quiereEntrar(unaCarpa) {
		
		return super(unaCarpa) and
		
		unaCarpa.cantidadPersonas().even()
		
	}
}

