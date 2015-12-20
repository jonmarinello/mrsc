class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:mobile_start_a_project]

  def index
    @company_name = 'Mission Ridge Software Consulting, LLC'
    @active_tab = 'index'
  end


  def portfolio
    @active_tab = 'portfolio'
  end


  def about
    @active_tab = 'about'
    @person_image_width = 90
    @recommendations = Recommendation.ordered_recommendations
  end


  def get_recommendations
    respond_to do |format|
      format.json { render json: Recommendation.ordered_recommendations.to_json( :only => [:title, :body, :image_url] ) }
    end
  end


  def services
    @active_tab = 'services'
  end


  def contact
    @active_tab = 'contact'
  end


  def start_a_project
    @active_tab = 'start_a_project'
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
          render nothing: true, status: :ok, content_type: 'text/html'
        else
          # Respond with an error
          render nothing: true, status: 304, content_type: 'text/html'
        end
      end
    end
  end


  private

  def potential_project_request_params
    params.require(:potential_project).permit(
        :id, :name, :email, :project_idea, :phone, :company_name,
        :project_idea, :type_ruby_on_rails_web_development,
        :type_mobile_app_development, :type_cms_web_development, :type_everything_cloud,
        :type_ux_prototyping, :type_agile_development, :type_other, :start_timeframe,
        :additional_info, :heard_about_us, :keep_me_updated)
  end
end
