class CreatePotentialProjects < ActiveRecord::Migration
  def change
    create_table :potential_projects do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :company_name
      t.string :project_idea
      t.boolean :type_website
      t.boolean :type_ruby_on_rails
      t.boolean :type_web_design
      t.boolean :type_code_review
      t.boolean :type_other
      t.string :start_timeframe
      t.text :additional_info
      t.string :heard_about_us
      t.boolean :keep_me_updated

      t.timestamps
    end
  end
end
