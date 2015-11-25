class CreateMyApps < ActiveRecord::Migration
  def change
    create_table :my_apps do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :app_id
      t.string :javascript_origins
      t.string :secret_key

      t.timestamps null: false
    end
  end
end
