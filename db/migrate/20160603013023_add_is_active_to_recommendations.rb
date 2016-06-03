class AddIsActiveToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :is_active, :boolean, null: false, default: true
  end
end
