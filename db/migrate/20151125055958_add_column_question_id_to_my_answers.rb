class AddColumnQuestionIdToMyAnswers < ActiveRecord::Migration
  def change
    add_reference :my_answers, :question, index: true, foreign_key: true
  end
end
