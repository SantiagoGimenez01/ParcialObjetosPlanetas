import tecnicas.*

class Persona{
    var recursos = 20
    var edad

    method esDestacado() = self.tieneEdadDestacada() || recursos > 30
    method tieneEdadDestacada() = edad.between(18, 65)
    method ganarMonedas(cantidad){ recursos += cantidad }
    method gastarMonedas(cantidad){ recursos -= cantidad }
    method cumplirAnios(){ edad += 1 }
    method recursos() = recursos
}

class Productos inherits Persona{
    const tecnicas = #{cultivo}

    override method recursos() = super() * tecnicas.size()
    override method esDestacado() = super() || self.conoceSuficientesTecnicas()
    method conoceSuficientesTecnicas() = tecnicas.size() > 5
    method realizar(tecnica, tiempo){
        if(self.conoce(tecnica))
            tecnica.serRealizadaPor(self, tiempo)
        else
            self.gastarMonedas(1)

    }
    method conoce(tecnica) = tecnicas.contains(tecnica)
    method aprender(tecnica){ tecnicas.add(tecnica) }
    method trabajar(planeta, tiempo){ 
        if(!planeta.viveAlli(self))
            throw new DomainException(message="El productor no puede realizar el trabajo en ese planeta ya que no vive alli")
        self.realizar(self.ultimaTecnica(), tiempo)
    }
    method ultimaTecnica() = tecnicas.last()
}