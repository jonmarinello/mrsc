class PagesController < ApplicationController
  include ApplicationHelper

  skip_before_action :verify_authenticity_token, :only => [:mobile_start_a_project]

  def index
    @company_name = 'Mission Ridge Software Consulting, LLC'
    @active_tab = 'index'
    @title = default_application_title + ' - Home'
  end


  def portfolio
    @active_tab = 'portfolio'
    set_title
  end


  def about
    @active_tab = 'about'
    set_title
    @person_image_width = 90
    @recommendations = Recommendation.active_and_ordered
  end


  def get_recommendations
    respond_to do |format|
      format.json { render json: Recommendation.active_and_ordered.to_json(:only => [:title, :body, :image_url] ) }
    end
  end


  def services
    @active_tab = 'services'
    set_title
  end


  def contact
    @active_tab = 'contact'
    set_title
  end


  def start_a_project
    @active_tab = 'start_a_project'
    set_title
    @potential_project = PotentialProject.new
  end


  def create
    @active_tab = nil
    @potential_project = PotentialProject.new(potential_project_request_params)

    if @potential_project.save
      # Save succeeded so send email letting us know that someone wants to start a project
      NewPotentialProjectMailer.new_potential_project(@potential_project).deliver_later

      # Redirect to the thank you landing page
      redirect_to pages_start_a_project_landing_page_path
    else
      # An error occurred so re-render the page with existing data and error message
      flash.now[:alert] = 'An Error occurred.'
      render 'start_a_project'
    end
  end


  def start_a_project_landing_page
    @active_tab = nil
    @title = default_application_title + ' - Thank You'
  end


  def mobile_start_a_project
    @active_tab = nil

    respond_to do |format|
      format.html do
        @potential_project = PotentialProject.new(potential_project_request_params)

        if @potential_project.save
          # Save succeeded so send email letting us know that someone wants to start a project
          NewPotentialProjectMailer.new_potential_project(@potential_project).deliver_later

          # Respond with all ok
          head :ok, content_type: 'text/html'
        else
          # Respond with an error
          head 304, content_type: 'text/html'
        end
      end
    end
  end


  private

  def set_title
    @title = default_application_title + " - #{@active_tab.titleize}"
  end

  def potential_project_request_params
    params.require(:potential_project).permit(
        :id, :name, :email, :project_idea, :phone, :company_name,
        :project_idea, :type_ruby_on_rails_web_development,
        :type_mobile_app_development, :type_cms_web_development, :type_everything_cloud,
        :type_ux_prototyping, :type_agile_development, :type_other, :start_timeframe,
        :additional_info, :heard_about_us, :keep_me_updated)
  end
end
