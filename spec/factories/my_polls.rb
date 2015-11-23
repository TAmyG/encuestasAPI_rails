FactoryGirl.define do
    
  factory :my_poll do
  	association :user, factory: :sequence_user
    expires_at "2015-11-20 10:41:15"
    title "MyString10"
    description "MyText corregido en escuela de vacaiones 2015 para todos los alumnos"
    factory :poll_with_questions do
    	association :user, factory: :sequence_user
	    title "Poll with questions"
	    description "MyText corregido en escuela de vacaiones 2015 para todos los alumnos"
	    questions { build_list :question, 2 }
    end
  end
    
end
