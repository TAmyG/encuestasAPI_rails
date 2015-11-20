class CreateMyPolls < ActiveRecord::Migration
  def change
    create_table :my_polls do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :expires_at
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
