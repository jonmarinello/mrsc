ActiveAdmin.register PotentialProject do
  permit_params :id, :name, :email, :phone, :company_name, :project_idea, :type_website, :type_ruby_on_rails,
                :type_web_design, :type_code_review, :type_other, :start_timeframe, :additional_info, :heard_about_us,
                :keep_me_updated


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
