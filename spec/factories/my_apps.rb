FactoryGirl.define do
#Se quitó los otros atributos ya que deben ser generados
#automáticamente por el modelo
  factory :my_app do
    association :user, factory: :user
	title "MyString"
	javascript_origins "http://localhost"
	#app_id "MyString"	
	#secret_key "MyString"
  end

end
