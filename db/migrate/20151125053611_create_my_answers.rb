class CreateMyAnswers < ActiveRecord::Migration
  def change
    create_table :my_answers do |t|
      t.references :user_poll, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
