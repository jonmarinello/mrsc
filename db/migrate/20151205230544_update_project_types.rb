class UpdateProjectTypes < ActiveRecord::Migration
  def change
    rename_column :potential_projects, :type_website, :type_ruby_on_rails_web_development
    rename_column :potential_projects, :type_web_design, :type_mobile_app_development
    rename_column :potential_projects, :type_ruby_on_rails, :type_cms_web_development
    rename_column :potential_projects, :type_code_review, :type_everything_cloud
    add_column :potential_projects, :type_ux_prototyping, :boolean
    add_column :potential_projects, :type_agile_development, :boolean
  end
end
