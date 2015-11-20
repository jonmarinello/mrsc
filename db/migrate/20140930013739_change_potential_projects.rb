class ChangePotentialProjects < ActiveRecord::Migration
  def self.up
    change_column :potential_projects, :name, :string, null: false
    change_column :potential_projects, :email, :string, null: false
    change_column :potential_projects, :project_idea, :text, null: false
  end

  def self.down
    change_column :potential_projects, :name, :string, null: true
    change_column :potential_projects, :email, :string, null: true
    change_column :potential_projects, :project_idea, :string, null: true
  end
end
