class AddRecommendationImageUrl < ActiveRecord::Migration
  def change
    add_column :recommendations, :image_url, :string, :null => false, :default => ''
  end
end
