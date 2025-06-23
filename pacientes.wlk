class Paciente {
  const aparatosDeRutina = []
  const edad
  var fortalezaMuscular
  var nivelDeDolor

  method edad() = edad
  method fortalezaMuscular() = fortalezaMuscular
  method nivelDeDolor() = nivelDeDolor

  method calmarElDolor(nuevoNivel) {
    nivelDeDolor = 0.max(nivelDeDolor - nuevoNivel) 
  }
  method aumentarFuerzaMuscular(nuevoNivel) {
    fortalezaMuscular = fortalezaMuscular + nuevoNivel
  }

  method puedeUsarElAparato(unAparato) = unAparato.condicionDeUso(self)
  method usarAparato(unAparato) {
    if(self.puedeUsarElAparato(unAparato)) {
      unAparato.consecuenciaDeUso(self)
    }
  }
  // Parte 2 (Rutina)
  method puedeHacerRutinaAsignada() = aparatosDeRutina.all( {a => self.puedeUsarElAparato(a)} )
}

class Magneto {
  method condicionDeUso(unPaciente) = true
  method consecuenciaDeUso(unPaciente) {
    unPaciente.calmarElDolor(unPaciente.nivelDeDolor() * 0.1)
  }
}

class Bicicleta {
  method condicionDeUso(unPaciente) = unPaciente.edad() > 8
  method consecuenciaDeUso(unPaciente) {
    unPaciente.calmarElDolor(4)
    unPaciente.aumentarFuerzaMuscular(3)
  }
}

class Minitramp {
  method condicionDeUso(unPaciente) = unPaciente.nivelDeDolor() < 20
  method consecuenciaDeUso(unPaciente) {
    unPaciente.aumentarFuerzaMuscular(unPaciente.edad() * 0.1)
  }
}