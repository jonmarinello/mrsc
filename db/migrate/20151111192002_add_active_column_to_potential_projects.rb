class AddActiveColumnToPotentialProjects < ActiveRecord::Migration
  def change
    add_column :potential_projects, :is_active, :boolean, null: false, default: true
  end
end
