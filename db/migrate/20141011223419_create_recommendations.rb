class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
