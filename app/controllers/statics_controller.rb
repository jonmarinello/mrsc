class StaticsController < ApplicationController
  def index
    @active_tab = 'index'
  end

  def projects
    @active_tab = 'projects'
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
