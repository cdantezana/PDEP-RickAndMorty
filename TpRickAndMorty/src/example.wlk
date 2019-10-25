class Rick {

	var property nivelDemencia
	const familia = []
	var acompaniante

	method asignarAcompaniante() {
		if ((!familia.isEmpty())) {
			acompaniante = familia.anyOne()
		}
	}

	method aumentarDemencia(cantidad) {
		nivelDemencia += cantidad
	}

	method seVaDeAventura() {
		if (acompaniante.puedeIrAventura()) {
			acompaniante.seVaDeAventura(self)
			if (self.nivelDemencia() < 100) {
				return true
			}
		}
		nivelDemencia /= 2
		return false
	}

}

//Para probar los casos
const unRicky = new Rick(nivelDemencia = 10, familia = [ unMorty, unBeth, unSummer, unJerry ], acompaniante = unMorty)const unMorty = new Morty(saludMental = 20)const unBeth = new Beth(afectoPadre = 30)const unSummer = new Summer(afectoPadre = 30)const unJerry = new Jerry()class Morty {

	var saludMental

	method puedeIrAventura() = true

	method seVaDeAventura(ricky) {
		saludMental -= 30
		ricky.aumentarDemencia(50)
	}

}

class Beth {

	var afectoPadre

	method puedeIrAventura() = true

	method seVaDeAventura(ricky) {
		afectoPadre -= 10
		ricky.aumentarDemencia(-20)
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

	method puedeIrAventura() = false

}

