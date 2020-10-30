import jarra.*
import personas.*
class Carpa{
	var property limiteGente
	var property tieneMusicaTrad
	var property marca
	var property personasDentro=#{}
	method agregarPersona(persona){
		personasDentro.add(persona)
	}
	method dejaIngresar(persona){
		return personasDentro.size()+1 <=limiteGente && not persona.estaEbria()
	}
	method servirJarra(persona,litros){
		if(personasDentro.contains(persona)){
			persona.comprarJarra(new Jarra(capacidad=litros,marca=self.marca()))
		}else{
			self.error("la persona no esta en la carpa")
		}
	}
	
}