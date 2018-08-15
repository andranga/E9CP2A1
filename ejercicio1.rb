class Table
  attr_reader :name
  def initialize(name, dia1, dia2, dia3, dia4)
    @name = name
    @dia1 = dia1.to_i
    @dia2 = dia2.to_i
    @dia3 = dia3.to_i
    @dia4 = dia4.to_i
  end
  def mayor_dia
  	recauda = {:d1=>@dia1, :d2=>@dia2, :d3=>@dia3, :d4=>@dia4}
  	recauda.max_by { |day, recauda| recauda }
  end
  def promedio_recauda
  	promedio = (@dia1 + @dia2 + @dia3 + @dia4)/4
  end
end

def leer_file
	data=[]
	File.open("casino.txt", "r") { |file| data=file.readlines.map { |w| w.chomp.split(', ') } }
	print data
	table1 = Table.new(*data[0])
	table2 = Table.new(*data[1])
	table3 = Table.new(*data[2])
	table4 = Table.new(*data[3])

	puts "#{table1.name}: #{table1.mayor_dia}"
	puts "#{table2.name}: #{table2.mayor_dia}"
	puts "#{table3.name}: #{table3.mayor_dia}"
	puts "#{table4.name}: #{table4.mayor_dia}"

	puts "El promedio de todas las mesas en los 4 dìas es: #{(table1.promedio_recauda + table2.promedio_recauda + table3.promedio_recauda + table4.promedio_recauda)/4}"
end

leer_file
