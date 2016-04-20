class Visitante < ActiveRecord::Base
has_no_table
column :nombre, :string

def nombre
	 nombre = "<coloca tu nombre>" 
end 

def fechacumple
	$fechacumple= Date.new(1990, 12, 22) 
end 

def conteo
  hoy= Date.today
  $fechacumple= Date.new(hoy.year, $fechacumple.month, $fechacumple.day) 
  if $fechacumple > hoy
	conteo = ($fechacumple - hoy).to_i 
  else 
	conteo = ($fechacumple.next_year - hoy).to_i 
  end 
end 

end
