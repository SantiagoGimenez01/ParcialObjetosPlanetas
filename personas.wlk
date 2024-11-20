class Persona{
    var recursos = 20
    var edad

    method esDestacado() = self.tieneEdadDestacada() || recursos > 30
    method tieneEdadDestacada() = edad.between(18, 65)
    method ganarMonedas(cantidad){ recursos += cantidad }
    method gastarMonedas(cantidad){ recursos -= cantidad }
    method cumplirAnios(){ edad += 1 }
}