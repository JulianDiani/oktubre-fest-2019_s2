import marcas.*
import jarra.*
class Persona{
	var property peso
	var property cervezasCompradas=[]
	var property escuchaMusicaTradicional=true
	var property nivelDeAguante
	var property pais
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
		return cervezasCompradas.all({c=>c.pais()==self.pais()})
	}
	method sonCompatibles(persona1,persona2){

		return persona1.cervezasCompradas().asSet().intersection(persona2.cervezasCompradas().asSet().size())
												>
			   persona1.cervezasCompradas().asSet().difference	(persona2.cervezasCompradas().asSet().size())
		
	}
	method carpasEnLasQueSeSirvio(){
		return cervezasCompradas.filter({c=>c.carpaDondeSeSirvio()})
	}
	method seSirvioAlgunaEn(carpa){
		return not cervezasCompradas.any({c=>c.carpaDondeSeSirvio()==carpa})
	}
	method estaEntrandoEnElVicio(){
		if(cervezasCompradas.size()>1){
		return cervezasCompradas.all({j=>cervezasCompradas.get(j).capacidad()>=cervezasCompradas.get(j-1).capacidad()})
		}else{
			return false
		}
	}
}
class Belga inherits Persona{
	override method leGusta(cerveza){
	    	return cerveza.lupulo()>4
	    }
	    method esPatriota(cerveza){
	    	return cervezasCompradas.all({c=>c.pais()=="alemania"})
	    }
}
class Checo inherits Persona{
	override method leGusta(cerveza){
		return cerveza.graduacion()>8
	}
	method esPatriota(cerveza){
		return cervezasCompradas.all({c=>c.pais()=="RepublicaCheca"})
	}
}
class Aleman inherits Persona{
	override method leGusta(cerveza){
		return true
	}
	override method quiereEntrar(carpa){
		return super(carpa)&&carpa.personasDentro().size().even() 
	}
	override method esPatriota(){
		return cervezasCompradas.all({c=>c.pais()=="alemania"})
	}
}