
class Roulette
  def initialize()
    @numeros = (1..10).to_a
  end
  def play(apuesta)
  	ganador=rand(1..10)
  	File.open("roulette_history.txt", "a") { |file| file.puts "#{ganador}, "}
  	if ganador==apuesta
  		File.open("winners.txt", "a") { |file| file.puts "#{ganador}, "}
  	end
  end
end

def max_history
	data=[]
	stats=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	File.open("roulette_history.txt", "r") { |file| data=file.readlines.map { |w| w.chomp.split(', ') } }
	
	puts data
	puts "Mas frecuente es: #{data.max}"
end

r1=Roulette.new
r1.play(5)
r1.play(5)
r1.play(5)
r1.play(5)
r1.play(5)
r1.play(5)
r1.play(5)
r1.play(5)
r1.play(5)
max_history
