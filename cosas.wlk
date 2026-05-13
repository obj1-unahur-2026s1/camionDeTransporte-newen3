object KnightRider {
  method peso() = 500
  method nivelDePeligro() = 10
  method bultos() = 1
  method reaccionarAlCargar() {}
}

object Bumblebee {
  var transformacion = "auto"

  method peso() = 800

  method nivelDePeligro() =
    if (transformacion == "auto") 15 else 30

  method transformarseEnRobot() {
    transformacion = "robot"
  }

  method transformarEnAuto() {
    transformacion = "auto"
  }
  method bultos() = 1

  method reaccionarAlCargar() {transformacion = "robot"}
}

object paqueteDeLadrillos {
  var cantidad = 1

  method peso() = cantidad * 2
  method nivelDePeligro() = 2

  method nuevaCantidad(n) {
    cantidad = n
  }
  method bultos() {
    if (cantidad <= 100) {
        return 1
    } else if (cantidad <= 300) {
        return 2
    } else {
        return 3
    }
}
method reaccionarAlCargar() {cantidad += 12}
}

object ArenaGranel {
  var cantidad = 0

  method peso() = cantidad
  method nivelDePeligro() = 1

  method definirCantidad(n) {
    cantidad = n
  }
  method bultos() = 1
  method reaccionarAlCargar() {cantidad -= 10}
}

object BateriaAntiaerea {
  var misiles = false

  method peso() = if (misiles) 300 else 200
  method nivelDePeligro() = if (misiles) 100 else 0

  method cargarMisiles() { misiles = true }
  method descargarMisiles() { misiles = false }
  method bultos() {
    if (misiles) {
        return 2
    } else {
        return 1
    }
}
    method reaccionarAlCargar() {misiles = true}
}

object ContenedorPortuario {
  var cosasDentro = []

  method agregarCosa(cosa) {
    cosasDentro.add(cosa)
  }

  method peso() = 100 + cosasDentro.map({ x => x.peso() }).sum()

  method nivelDePeligro() =
    if (cosasDentro.isEmpty()) 0 else cosasDentro.map({ x => x.nivelDePeligro() }).max()
  method bultos() = 1 + cosasDentro.map({ x => x.bultos() }).sum()

  method reaccionarAlCargar() {
        cosasDentro.each({ x => x.reaccionarAlCargar() })
    }
}

object ResiduosRadioactivos {
  var cantidad = 30

  method peso() = cantidad
  method nivelDePeligro() = 200

  method definirCantidad(n) {
    cantidad = n
    }
  method bultos() = 1
    method reaccionarAlCargar() {cantidad += 15}
}

object EmbalajeDeSeguridad {
  var cosaDentro = paqueteDeLadrillos

  method cambiarCosaDentro(cosa) {
    cosaDentro = cosa
  }

  method peso() = cosaDentro.peso()
  method nivelDePeligro() = cosaDentro.nivelDePeligro() / 2
  method bultos() = 2
  method reaccionarAlCargar() {}
}