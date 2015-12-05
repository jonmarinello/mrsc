ActiveAdmin.register PotentialProject do
  permit_params :id, :name, :email, :phone, :company_name, :project_idea, :type_ruby_on_rails_web_development,
                :type_mobile_app_development, :type_cms_web_development, :type_everything_cloud,
                :type_ux_prototyping, :type_agile_development, :type_other, :start_timeframe, :additional_info,
                :heard_about_us, :keep_me_updated, :is_active

  index do
    selectable_column
    id_column
    column 'Active', :is_active
    column :name
    column 'Telephone', :phone do |potential_project|
      number_to_phone(potential_project.phone, area_code: true).sub('1(', '(') if potential_project.phone.present?
    end
    column :company_name
    column :start_timeframe
    column :type_ruby_on_rails_web_development
    column :type_mobile_app_development
    column :type_cms_web_development
    column :type_everything_cloud
    column :type_ux_prototyping
    column :type_agile_development
    column :type_other
    column :keep_me_updated
    actions
  end

  filter :name
  filter :phone
  filter :company_name
  filter :type_ruby_on_rails_web_development
  filter :type_mobile_app_development
  filter :type_cms_web_development
  filter :type_everything_cloud
  filter :type_ux_prototyping
  filter :type_agile_development
  filter :type_other
  filter :keep_me_updated

  scope :all
  scope :active
end
