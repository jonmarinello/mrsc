class StaticsController < ApplicationController

  def index
    @company_name = 'Mission Ridge Software Consulting, LLC'
    @active_tab = 'index'
  end

  def projects
    @active_tab = 'projects'
    @person_image_width = 120
  end

  def about
    @active_tab = 'about'
  end

  def services
    @active_tab = 'services'
  end

  def contact
    @active_tab = 'contact'
  end

end
