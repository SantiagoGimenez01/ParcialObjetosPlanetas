class Planeta{
    const habitantes = #{}
    const construcciones = #{}

    method delegacionDiplomatica() = habitantes.filter({habitante => habitante.esDestacado() || self.elMasRico()})
    method elMasRico() = habitantes.max({habitante => habitante.recursos()})
    method esValioso() = construcciones.all({construccion => construccion.valor() > 100})
    method agregarConstruccion(construccion){ construcciones.add(construccion) }
    method viveAlli(alguien) = habitantes.contains(alguien)
}