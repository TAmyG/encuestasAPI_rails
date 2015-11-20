FactoryGirl.define do
  factory :my_poll do
    association :user, factory: :user
    expires_at "2015-11-20 10:41:15"
    title "MyString10"
    description "MyText corregido en escuela de vacaiones 2015 para todos los alumnos"
  end

end
