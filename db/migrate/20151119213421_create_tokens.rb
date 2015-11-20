class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.datetime :expires_at
      t.references :user, index: true, foreign_key: true
      t.string :token

      t.timestamps null: false
    end
  end
end