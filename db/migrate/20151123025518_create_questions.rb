class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :my_poll, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
