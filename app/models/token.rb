class Token < ActiveRecord::Base
    belongs_to :user
    belongs_to :my_app
    before_create :generate_token
    
    #retorna true si la fecha actual es menor a la de expiración
    def is_valid?
        DateTime.now < self.expires_at
    end
    
    
    private 
    def generate_token
        #busco si hay un token igual para generar uno distinto, sino salgo del ciclo
        begin 
            self.token = SecureRandom.hex
        end while Token.where(token: self.token).any?
            #la fecha expira en un mes, para el token valido
        self.expires_at ||= 1.month.from_now
    end        
end