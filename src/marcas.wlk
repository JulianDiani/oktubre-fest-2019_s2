import personas.*
import jarra.*
class Cerveza{
	var property lupulo
	var property pais
	method graduacion()
}
class CervezaRubia inherits Cerveza{
	//var property marca
	
	var property graduacion
}
class CervezaNegra inherits Cerveza{
	const property graduacionReglamentaria
	override  method graduacion(){
		return graduacionReglamentaria.min(2*lupulo)
	}
}
class CervezaRoja inherits CervezaNegra{
	override method graduacion(){
		return super()*1.25
	}
}
