class StaticsController < ApplicationController

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
  end

  def services
    @active_tab = 'services'
  end

  def contact
    @active_tab = 'contact'
  end

end
