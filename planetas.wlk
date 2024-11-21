import construcciones.*
import personas.*
class Planeta{
    const habitantes = #{}
    const construcciones = #{}

    method delegacionDiplomatica() = habitantes.filter({habitante => habitante.esDestacado() || self.elMasRico()})
    method elMasRico() = habitantes.max({habitante => habitante.recursos()})
    method esValioso() = construcciones.all({construccion => construccion.valor() > 100})
    method agregarConstruccion(construccion){ construcciones.add(construccion) }
    method viveAlli(alguien) = habitantes.contains(alguien)
    method cantidadDeConstrucciones() = construcciones.size()
    method delegacionTrabaja(tiempo){
        self.delegacionDiplomatica().forEach({integrante => integrante.trabajar(self, tiempo)})
    }
    method invadir(otroPlaneta, tiempo){ otroPlaneta.delegacionDiplomatica().forEach({integrante => integrante.trabajar(self, tiempo)}) }
}

object montania{
    method construir(trabajador, tiempo) = new Muralla(longitud = tiempo/2)
}

object costa{
    method construir(trabajador, tiempo) = new Museo(superficieCubierta = tiempo, indiceImportancia = 1)
}

object llanura{
    method construir(trabajador, tiempo) = if(trabajador.esDestacado()) self.construirMuseo(trabajador, tiempo) else self.construirMuralla(tiempo)
    method construirMuseo(trabajador, tiempo) = new Museo(superficieCubierta = tiempo, indiceImportancia = (trabajador.recursos()/50).min(5))
    method construirMuralla(tiempo) = new Muralla(longitud=tiempo/2)
}

object ciudad{
    method construir(trabajador, tiempo) = if(trabajador.inteligencia()>15) self.construirMuseo(trabajador) else self.construirMuralla(trabajador, tiempo)
    method construirMuseo(trabajador) = new Museo(superficieCubierta = trabajador.recursos(), indiceImportancia = 3)
    method construirMuralla(trabajador, tiempo) = new Muralla(longitud=tiempo/trabajador.inteligencia()) 
}