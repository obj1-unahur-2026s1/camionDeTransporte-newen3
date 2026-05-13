import cosas.*
object camion {
  const pesoTara = 1000
  var cosasCargadas = [KnightRider, Bumblebee]

  method cargar(cosa) {
    cosasCargadas.add(cosa)
    cosa.reaccionarAlCargar()
  }

  method descargar(cosa) {
    cosasCargadas.remove(cosa)
  }

  method pesoCargado() = cosasCargadas.map({ x => x.peso() }).sum()

  method peso() = pesoTara + self.pesoCargado()

  method pesoCargadoEsPar() = cosasCargadas.all({ x => x.peso().even() })

  method buscarPeso(pesoABuscar) = cosasCargadas.filter({ x => x.peso() == pesoABuscar })

  method buscarPeligro(nivel) = cosasCargadas.find({ x => x.nivelDePeligro() == nivel })

  method buscarMayorPeligro(nivel) = cosasCargadas.filter({ x => x.nivelDePeligro() > nivel })

  method estaExcedidoEnPeso() = self.peso() > 2500

  method puedeCircular(nivelPermitido) =
    !self.estaExcedidoEnPeso() && cosasCargadas.all({ x => x.nivelDePeligro() <= nivelPermitido })

  method cosasEntre(pesoMin, pesoMax) =
    cosasCargadas.filter({ x => x.peso() > pesoMin && x.peso() < pesoMax })

  method cosaConMayorPeso() =
    cosasCargadas.max({ x => x.peso() })

  method bultos() =
    cosasCargadas.map({ x => x.bultos() }).sum() + 1 // +1 por la tara del camion

}
