require 'rspec' 
require_relative '../model/partida'
require_relative '../model/papel'
require_relative '../model/piedra'
require_relative '../model/tijera'
require_relative '../model/mono'

describe 'Piedra-papel-tijeras' do

  let(:partida) { Partida.new(3) }  

  it 'jugador 1 gana la ronda usando papel' do
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Piedra.new)
    expect(partida.jugar_ronda(0)).to eq "jugador1gana"
  end

  it 'jugador 1 pierde la ronda usando papel' do
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Tijera.new)
    expect(partida.jugar_ronda(0)).to eq "jugador2gana"
  end

  it 'jugador 1 empata la ronda usando papel' do
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Papel.new)
    expect(partida.jugar_ronda(0)).to eq "empate"
  end

  it 'jugador 1 gana la ronda usando piedra' do
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Tijera.new)
    expect(partida.jugar_ronda(0)).to eq "jugador1gana"
  end

  it 'jugador 1 empata la ronda usando piedra' do
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Piedra.new)
    expect(partida.jugar_ronda(0)).to eq "empate"
  end

  it 'jugador 1 pierde la ronda usando piedra' do
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Papel.new)
    expect(partida.jugar_ronda(0)).to eq "jugador2gana"
  end

  it 'jugador 1 empata la ronda usando piedra' do
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Piedra.new)
    expect(partida.jugar_ronda(0)).to eq "empate"
  end

  it 'jugador 1 gana la ronda usando tijera' do
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Papel.new)
    expect(partida.jugar_ronda(0)).to eq "jugador1gana"
  end

  it 'jugador 1 empata la ronda usando tijera' do
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Tijera.new)
    expect(partida.jugar_ronda(0)).to eq "empate"
  end

  it 'jugador 1 pierde la ronda usando tijera' do
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Piedra.new)
    expect(partida.jugar_ronda(0)).to eq "jugador2gana"
  end

  it 'jugador 1 gana la ronda usando mono' do
    partida.jugador1usa!(Mono.new)
    partida.jugador2usa!(Papel.new)
    expect(partida.jugar_ronda(0)).to eq "jugador1gana"
  end

  it 'jugador 1 empata la ronda usando mono' do
    partida.jugador1usa!(Mono.new)
    partida.jugador2usa!(Mono.new)
    expect(partida.jugar_ronda(0)).to eq "empate"
    partida.jugador1usa!(Mono.new)
    partida.jugador2usa!(Piedra.new)
    expect(partida.jugar_ronda(0)).to eq "empate"
  end

  it 'jugador 1 pierde la ronda usando mono' do
    partida.jugador1usa!(Mono.new)
    partida.jugador2usa!(Tijera.new)
    expect(partida.jugar_ronda(0)).to eq "jugador2gana"
  end

  it 'jugador 1 gana la ronda usando tijera contra mono' do
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Mono.new)
    expect(partida.jugar_ronda(0)).to eq "jugador1gana"
  end

  it 'jugador 1 empata la ronda usando piedra contra mono' do
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Mono.new)
    expect(partida.jugar_ronda(0)).to eq "empate"
  end

  it 'jugador 1 pierde la ronda usando papel contra mono' do
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Mono.new)
    expect(partida.jugar_ronda(0)).to eq "jugador2gana"
  end

  it 'jugador 1 gana la partida' do
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(0)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Tijera.new)
    partida.jugar_ronda(1)
    expect(partida.resultado).to eq "jugador1gana"
  end

  it 'jugador 1 gana la partida a desempate' do 
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(0)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Piedra.new)
    partida.jugar_ronda(1)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Tijera.new)
    partida.jugar_ronda(2)
    expect(partida.resultado).to eq "jugador1gana"
  end

  it 'jugador 1 pierde la partida a desempate' do 
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(0)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Piedra.new)
    partida.jugar_ronda(1)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Piedra.new)
    partida.jugar_ronda(2)
    expect(partida.resultado).to eq "jugador2gana"
  end	

  it 'jugador 1 pierde la partida a dos rondas' do 
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Tijera.new)
    partida.jugar_ronda(0)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(1)
    expect(partida.resultado).to eq "jugador2gana"
  end	

  it 'se empata la partida' do 
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Tijera.new)
    partida.jugar_ronda(0)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Piedra.new)
    partida.jugar_ronda(1)
    expect(partida.resultado).to eq "sin definir" 
    partida.jugador1usa!(Mono.new)
    partida.jugador2usa!(Piedra.new)
    partida.jugar_ronda(2)
    expect(partida.resultado).to eq "empate"
  end

  it 'jugador 1 gana la partida con victorias intercaladas' do 
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(0)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(1)
    expect(partida.resultado).to eq "sin definir" 
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Piedra.new)
    partida.jugar_ronda(2)
    expect(partida.resultado).to eq "jugador1gana"
  end

  it 'juego en empate con 2 victorias y 1 empate' do 
    partida.jugador1usa!(Tijera.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(0)
    expect(partida.resultado).to eq "sin definir"
    partida.jugador1usa!(Piedra.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(1)
    expect(partida.resultado).to eq "sin definir" 
    partida.jugador1usa!(Papel.new)
    partida.jugador2usa!(Papel.new)
    partida.jugar_ronda(2)
    expect(partida.resultado).to eq "empate"
  end
end
