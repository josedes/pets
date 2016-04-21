class UsuarioCorreo < ActionMailer::Base
 default from: "do-not-reply@example.com" 

  def contacto_email(contacto)
    #contacto.email es el email del visitante
    #OWNER_EMAIL email del propietario del site configurado con figaro	
    @contacto = contacto
    puts contacto.email
    mail(to: ENV["OWNER_EMAIL"], from: contacto.email, :subject => "Contacto Mascotas") 
  end 

end
