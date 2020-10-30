import marcas.*
import personas.*
class Jarra{
	var property capacidad
	//var property marca
	var property marca
	method contenidoDeAlcohol(){
		return marca.graduacion()*self.capacidad()
	}
}

