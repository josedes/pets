class Visitante < ActiveRecord::Base
has_no_table

attr_accessor :email, :string

 validates_presence_of :email
 validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

#column :nombre, :string

def nombre
	 nombre = "<coloca tu nombre>" 
end 


def fechacumple
	$fechacumple= Date.new(1990, 12, 22) 
end 

def conteo
	Rails.logger.debug 'DEBUG: Entrando en el método conteo del modelo de visitante'

  hoy= Date.today
  $fechacumple= Date.new(hoy.year, $fechacumple.month, $fechacumple.day) 
  if $fechacumple > hoy
	conteo = ($fechacumple - hoy).to_i 
  else 
	conteo = ($fechacumple.next_year - hoy).to_i 
  end 
end 

def subscripcion

#@list_id = ENV["MAILCHIMP_LIST_ID"]	
#gb = Gibbon::API.new

#    gb.lists.subscribe({
#      :id => @list_id,
#      :email => {:email => self.email}
#      })

list_id = ENV['MAILCHIMP_LIST_ID']
puts list_id
    @gibbon = Gibbon::Request.new 
    subscribe = @gibbon.lists(list_id).members.create(
    	body: { email_address: self.email, status: "subscribed", double_optin: false })
     Rails.logger.info("Ya #{self.email} está subscrito a MailChimp") if subscribe


=begin
	
rescue Exception => e
	
endmailchimp = Gibbon::API.new(ENV["MAILCHIMP_API_KEY"])
#gibbon = Gibbon::Request.new(ENV["MAILCHIMP_API_KEY"])

result = mailchimp.lists.subscribe({
	:id => ENV['MAILCHIMP_LIST_ID'], 
	:email => {:email => self.email},
	:double_optin => false,    	   #para enviar confirmación del correo enviado
	:update_existing => true,  	   #actualiza el registro del subscritor si este existe
	:send_welcome => true	       #envía un mensaje de bienvenida al subscritor	
})
Rails.logger.info("#{self.email} está subscrito a MailChimp") if result 


=end
end


  

end
