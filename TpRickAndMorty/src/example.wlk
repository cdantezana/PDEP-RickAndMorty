class Rick {

	var property nivelDemencia = 0
	const familia = []
	var acompaniante

	method asignarAcompaniante() {
		if ((!familia.isEmpty())) {
			acompaniante = familia.anyOne()
		}
		return acompaniante
	}

	method puedeIrAventura(){
		return (acompaniante.puedeIrAventura()  && nivelDemencia + acompaniante.variacionDemencia() <= 100)
	}
	
	method aumentarDemencia(cantidad) {
		nivelDemencia += cantidad
	}

	method seVaDeAventura() {
		if (self.puedeIrAventura()) {
			acompaniante.seVaDeAventura(self)
		}
		else{
		nivelDemencia /= 2
		}
	}

}

//Para probar los casos
const unRicky = new Rick(nivelDemencia = 10, familia = [ unMorty, unBeth, unSummer, unJerry ], acompaniante = unMorty)
const unMorty = new Morty(saludMental = 20)const unBeth = new Beth(afectoPadre = 30)const unSummer = new Summer(afectoPadre = 30)
const unJerry = new Jerry()

class Morty {
	const property variacionDemencia = 50
	var saludMental

	method puedeIrAventura() = true

	method seVaDeAventura(ricky) {
		saludMental -= 30
		ricky.aumentarDemencia(variacionDemencia)
	}

}

class Beth {
	const property variacionDemencia = -20
	var afectoPadre

	method puedeIrAventura() = true

	method seVaDeAventura(ricky) {
		afectoPadre -= 10
		ricky.aumentarDemencia(variacionDemencia)
	}

}

class Summer inherits Beth {

	override method puedeIrAventura() {
		const fecha = new Date()
			// 1 LUNES,2 MARTES, 3 MIERCOLES...
		return (fecha.internalDayOfWeek() == 3)
	}

}

class Jerry {
	const property variacionDemencia = 0
	method puedeIrAventura() = false
	method seVaDeAventura(_){}

}

