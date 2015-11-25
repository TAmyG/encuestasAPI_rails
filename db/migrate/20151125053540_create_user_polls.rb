class CreateUserPolls < ActiveRecord::Migration
  def change
    create_table :user_polls do |t|
      t.references :user, index: true, foreign_key: true
      t.references :my_poll, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
