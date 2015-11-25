class AddColumnAppIdToTokens < ActiveRecord::Migration
  def change
    add_reference :tokens, :my_app, index: true, foreign_key: true
  end
end
