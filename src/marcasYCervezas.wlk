class Cerveza {
	
	var property contenidoLupulo
	var property paisDeOrigen
	
}

class CervezaRubia inherits Cerveza {
	
	
    var property graduacion  
	
}

class CervezaNegra inherits Cerveza {

	method graduacion() {
		
	  return graduacionReglamentaria.graduacionR().min(self.contenidoLupulo()*2)
	
	}
	
}

class CervezaRoja inherits CervezaNegra {
	
	 override method graduacion() {
	 	
	 	 return super() * 1.25
	 
	 }
}




object graduacionReglamentaria {
	
	var property graduacionR
	
	
}

class Jarra {
	
	var property capacidad  /*la capacidad se mide en litros */
	
	var property marca
	
	
	
	method cantidadAlcohol() {
		return capacidad * (marca.graduacion()*0.01)
	}
	
}

