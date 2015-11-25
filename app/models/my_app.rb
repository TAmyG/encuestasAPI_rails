class MyApp < ActiveRecord::Base
  belongs_to :user
  has_many :tokens
  validates :title, presence: true
  validates :user, presence: true
  validates :secret_key, uniqueness: true
  validates :app_id, uniqueness: true

  before_create :generate_app_id
  before_create :generate_secret_key
  

  
#busca si el token pertenece a alguno de los tokens relacionados
#con la app
  def is_your_token?(token)
  	self.tokens.where(tokens: {id: token.id}).any?
  end

  def is_valid_origin?(domain)
    self.javascript_origins.split(",").include?(domain)
  end

  private
#crea una llave antes de crear la app en el modelo
  def generate_secret_key
  	#inicia un bloque que se detiene hasta que la llave creada
  	#no se encuentre en el modelo
  	begin 		
	  	self.secret_key = SecureRandom.hex
  	end while MyApp.where(secret_key: self.secret_key).any?
  end

  #genera automáticamte un id para la aplicación
  def generate_app_id
  	#inicia un bloque que se detiene hasta que la llave creada
  	#no se encuentre en el modelo
  	begin 		
	  	self.app_id = SecureRandom.hex
  	end while MyApp.where(app_id: self.app_id).any?
  end

end
