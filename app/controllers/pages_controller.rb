class PagesController < ApplicationController
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
    @recommendations = Recommendation.order(:position).all
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
      ::StartAProjectMailer.start_a_project(@potential_project).deliver

      # Redirect to the thank you landing page
      redirect_to start_a_project_landing_page_path
    else
      # An error occurred so re-render the page with existing data and error message
      flash[:alert] = 'An Error occurred.'
      render 'start_a_project'
    end
  end


  def start_a_project_landing_page
    @active_tab = nil
  end


  private

  def potential_project_request_params
    params.require(:potential_project).permit(
        :id, :name, :email, :project_idea, :phone, :company_name,
        :project_idea, :type_website, :type_ruby_on_rails, :type_web_design,
        :type_code_review, :type_other, :start_timeframe,
        :additional_info, :heard_about_us, :keep_me_updated)
  end
end
