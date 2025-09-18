import wollok.game.*
import utilidades.*
import combustibles.*

object lataDeCerveza {
  var property position = posicionAleatoria.calcular()
  var property longitudCm = 10
  
  method impactoEnLaHuellaDeCarbono() = 5 * longitudCm
  method nombre() = "lata_roja"
  method image() = self.nombre() + ".png"

  method esReciclable() = true
  
  method tratar() {
    longitudCm *= 0.9
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)

  }
}

object botellaDeGaseosa {
  var impactoEnHuellaDeCarbono = 100
  var property position = posicionAleatoria.calcular()
  
  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono

  method nombre() = "lata_naranja"

  method image() = self.nombre() + ".png"  

  method esReciclable() = true
  
  method tratar() {
    impactoEnHuellaDeCarbono -= 5
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
  }
}

object barrilDeCombustible {
  var property position = posicionAleatoria.calcular()
  var combustibleActual = biogas
  var combustibleAnterior = gasoil
  
  method impactoEnLaHuellaDeCarbono() = combustibleActual.consumo()
  
  method esReciclable() = false
  method nombre() =  "barril"
  method image() = self.nombre() + "_" + combustibleActual.sufijo()+ "_" + ".png"

  method cambiarCombustible() {
    const aux = combustibleActual
    combustibleActual = combustibleAnterior
    combustibleAnterior = aux
  }
  
  method combustibleActual() = combustibleActual
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
    game.removeTickEvent("cambiarCombustible")
  }
}

//Agregar una basura que recorra la pantalla de lado a lado.
//que pueda colisionar con capy y que sea recolecta por este.
//agregar nuevos objetos, personajes que se puedan mover (con el teclado o pueden moverse cada determinado tiempo)

object llanta {
  var impactoEnHuellaDeCarbono = 200
  var property position = posicionAleatoria.calcular()

  method moverDerecha(){
    position = position.right(1)
  }

  method moverIzquierda(){
    position = position.left(1)
  }
  
  method mover() =
    if (direccion = derecha) moverDerecha(1)
    if (direccion = izquierda) moverizquierda(1)
    if (position = game.width) cambiarDireccion

   

  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono

  method nombre() = "llantita"

  method image() = self.nombre() + ".png"  

  method esReciclable() = true
  
  method tratar() {
    impactoEnHuellaDeCarbono -= 10
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
  }
  
}
