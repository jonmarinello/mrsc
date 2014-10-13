class AcsAsList < ActiveRecord::Migration
  def change
    add_column :recommendations, :position, :integer
  end
end
