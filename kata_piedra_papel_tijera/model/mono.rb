class Mono

  def juega_contra(otro_movimiento)
    otro_movimiento.juega_contra_mono(self)
  end

  def juega_contra_piedra(una_piedra)
    Empate.new
  end

  def juega_contra_tijera(una_tijera)
  	Gana.new
  end

  def juega_contra_papel(un_papel)
  	Pierde.new
  end

  def juega_contra_mono(un_mono)
  	Empate.new
  end
end