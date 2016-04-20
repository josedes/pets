require 'date'
class Ejemplo < Object

attr_accessor :honorifico
attr_accessor :nombre
attr_accessor :fecha

def to_s #devuelve un string método sobre escrito
     @name 
end 

def initialize(nombre, fecha)
   @nombre = nombre
   @fecha = fecha.nil? ? Date.today : date 
end 

def t_nombre
	@honorifico ||= 'Estimado'
	t_nombre= "#{@honorifico} #{@nombre}" 
end 


def cumpleanos_diciembre
   nacido_diciembre = [ ] 
   cumple_famosos.each do |nombre, fecha| 
      if fecha.month == 12 
           nacido_diciembre << nombre
      end 
   end 
   nacido_diciembre 
end 

private 
def cumple_famosos
   cumple = { 
        'Maria Ramirez' => Date.new(1770,12,16), 
        'José Perez' => Date.new(1920,12,6),
        'Luis Sosa' => Date.new(1936,9,7),
        'Ana Silva' => Date.new(1943,12,18) 
     } 
   end 
end 
