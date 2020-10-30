import marcas.*
import jarra.*
class Persona{
	var property peso
	var property cervezasCompradas=[]
	var property escuchaMusicaTradicional=true
	var property nivelDeAguante
	method quiereEntrar(carpa){
		return self.leGusta(carpa.marca())&& self.escuchaMusicaTradicional()==carpa.tieneMusicaTrad()
	}
	method alcoholIngerido(){
		return cervezasCompradas.sum({j=>j.contenidoDeAlcohol()})
	}
	method estaEbria(){
		return self.alcoholIngerido()*peso>nivelDeAguante
	}
	method comprarJarra(birra){
		cervezasCompradas.add(birra)
	}
	method leGusta(cerveza){
		return true
	}
	method entrar(carpa){
		if(self.puedeEntrar(carpa)){
			carpa.agregarPersona(self)
		}
		else{self.error("no entra")}
	}
	method puedeEntrar(carpa){
		return carpa.dejaIngresar(self)
	}
	method esEbrioEmpedernido(){
		return self.estaEbria() && cervezasCompradas.forEach({j=>j.capacidad()>=1})
	}
	method esPatriota(){
		
	}
}
class Belga inherits Persona{
	override method leGusta(cerveza){
	    	return cerveza.lupulo()>4
	    }
	    method esPatriota(cerveza){
	    	return cerveza.pais()=="alemania"
	    }
}
class Checo inherits Persona{
	override method leGusta(cerveza){
		return cerveza.graduacion()>8
	}
}
class Aleman inherits Persona{
	override method leGusta(cerveza){
		return true
	}
	override method quiereEntrar(carpa){
		return super(carpa)&&carpa.personasDentro().size().even() 
	}
}