class PagesController < ApplicationController

  def index
    @company_name = 'Mission Ridge Software Consulting, LLC'
    @active_tab = 'index'
  end

  def projects
    @active_tab = 'projects'
  end

  def about
    @active_tab = 'about'
    @person_image_width = 90

    # Log that we are about to load the recommendations from our yaml file
    recommendations_path = File.join(Rails.root, 'app', 'models', 'about', 'recommendations.yml')
    puts 'Loading recommendations from: ' + recommendations_path

    # Load recommendations from our yaml file to be displayed in about page
    @recommendations = YAML::load_file(recommendations_path)
  end

  def services
    @active_tab = 'services'
  end

  def contact
    @active_tab = 'contact'
  end

end
