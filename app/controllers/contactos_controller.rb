class ContactosController < ApplicationController

def new
    @contacto = Contacto.new 
end 

def create
  @contacto = Contacto.new(secure_params)
  if @contacto.valid? 
     # Falta por salvar la data
     UsuarioCorreo.contacto_email(@contacto).deliver

     flash[:notice] = "Mensaje enviado de #{@contacto.nombre}." 
     redirect_to root_path 
  else
     render :new 
  end 
end 

private #solo los metodos de la clase pueden acceder a lo que este aquí
 
 def secure_params
   params.require(:contacto).permit(:nombre, :email, :mensaje) 
 end 

end