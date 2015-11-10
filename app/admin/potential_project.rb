ActiveAdmin.register PotentialProject do
  permit_params :id, :name, :email, :phone, :company_name, :project_idea, :type_website, :type_ruby_on_rails,
                :type_web_design, :type_code_review, :type_other, :start_timeframe, :additional_info, :heard_about_us,
                :keep_me_updated

  index do
    selectable_column
    id_column
    column :name
    column :phone do |potential_project|
      number_to_phone(potential_project.phone, area_code: true).sub('1(', '(') if potential_project.phone.present?
    end
    column :company_name
    column :start_timeframe
    column :type_website
    column :type_ruby_on_rails
    column :type_web_design
    column :type_code_review
    column :type_other
    actions
  end

  filter :name
  filter :phone
  filter :company_name
  filter :type_website
  filter :type_ruby_on_rails
  filter :type_web_design
  filter :type_code_review
  filter :type_other
  filter :keep_me_updated
end
