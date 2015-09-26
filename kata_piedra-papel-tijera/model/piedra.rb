class Piedra

	def contra(oponente)
		oponente.resultado(self)
	end

	def soy
		"piedra"
	end

	def resultado(oponente)
		case oponente.soy
			when "piedra"
				"empate"
			when "papel"
				"gana"
			when "tijera"
				"pierde"
			when "mono"
				"empate"
		end
	end	
end