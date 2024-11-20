class Planeta{
    const habitantes = []
    const construcciones = []

    method delegacionDiplomatica() = habitantes.filter({habitante => habitante.esDestacado() || self.elMasRico()})
    method elMasRico() = habitantes.max({habitante => habitante.recursos()})
    method esValioso() = construcciones.sum({construccion => construccion.valor()}) > 100
}