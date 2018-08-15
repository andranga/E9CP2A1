require 'date'

class Course
  attr_reader :name, :inicio
  def initialize(name, inicio, fin)
    @name = name
    @inicio = Date.strptime(inicio, '%Y-%m-%d')
    @fin = Date.strptime(fin, '%Y-%m-%d')
  end
end

def leer_file
	cursos=[]
	data=[]
	File.open("cursos.txt", "r") { |file| data=file.readlines.map { |w| w.chomp.split(', ') } }
	print data
	cursos[0] = Course.new(*data[0])
	cursos[1] = Course.new(*data[1])
	cursos[2] = Course.new(*data[2])
	cursos[3] = Course.new(*data[3])
	cursos[4] = Course.new(*data[4])
	return cursos
end

def cursos_previos(fecha, curso1, curso2, curso3, curso4, curso5)
	raise ArgumentError, 'Fecha no vàlida' if Date.strptime(fecha, '%Y-%m-%d')==Date.strptime('2018-01-01', '%Y-%m-%d')
	puts "#{curso1.name}: #{curso1.inicio}" if curso1.inicio<Date.strptime(fecha, '%Y-%m-%d')
	puts "#{curso2.name}: #{curso2.inicio}" if curso2.inicio<Date.strptime(fecha, '%Y-%m-%d')
	puts "#{curso3.name}: #{curso3.inicio}" if curso3.inicio<Date.strptime(fecha, '%Y-%m-%d')
	puts "#{curso4.name}: #{curso4.inicio}" if curso4.inicio<Date.strptime(fecha, '%Y-%m-%d')
	puts "#{curso5.name}: #{curso5.inicio}" if curso5.inicio<Date.strptime(fecha, '%Y-%m-%d')
end
	
def cursos_posterior(fecha, curso1, curso2, curso3, curso4, curso5)
	raise ArgumentError, 'Fecha no vàlida' if Date.strptime(fecha, '%Y-%m-%d')==Date.strptime('2018-01-01', '%Y-%m-%d')
	puts "#{curso1.name}: #{curso1.inicio}" if curso1.inicio>Date.strptime(fecha, '%Y-%m-%d')
	puts "#{curso2.name}: #{curso2.inicio}" if curso2.inicio>Date.strptime(fecha, '%Y-%m-%d')
	puts "#{curso3.name}: #{curso3.inicio}" if curso3.inicio>Date.strptime(fecha, '%Y-%m-%d')
	puts "#{curso4.name}: #{curso4.inicio}" if curso4.inicio>Date.strptime(fecha, '%Y-%m-%d')
	puts "#{curso5.name}: #{curso5.inicio}" if curso5.inicio>Date.strptime(fecha, '%Y-%m-%d')
end

cursosi=[]
cursosi=leer_file
cursos_previos('2017-05-01', *cursosi)
cursos_posterior('2017-05-01', *cursosi)


