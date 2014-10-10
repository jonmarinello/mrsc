require 'mandrill'

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


  def start_a_project
    @active_tab = 'start_a_project'
    @potential_project = PotentialProject.new
  end


  def create
    @potential_project = PotentialProject.new(portential_project_request_params)

    if @potential_project.save
      send_mail
      redirect_to start_a_project_landing_page_path
    else
      render 'start_a_project'
    end

  end


  def start_a_project_landing_page
  end


  private

  def send_mail
    m = Mandrill::API.new
    message = {
      :subject => 'Mission Ridge Software Consulting - Start Project Request',
      :from_name => @potential_project.email,
      :to => [
        {
          :email => "jonmarinello@gmail.com",
          :name => "Jon Marinello"
        }
      ],
      :html => "<html>\
                <strong><p>Name:</strong> #{@potential_project.name}</p>\
                <strong><p>Phone:</strong> #{@potential_project.phone}</p>\
                <strong><p>Company Name:</strong> #{@potential_project.company_name}</p>\
                <strong><p>Project Idea:</strong> #{@potential_project.project_idea}</p>\
                <strong><p>Website:</strong> #{@potential_project.type_website}</p>\
                <strong><p>Ruby On Rails:</strong> #{@potential_project.type_ruby_on_rails}</p>\
                <strong><p>Website Design:</strong> #{@potential_project.type_web_design}</p>\
                <strong><p>Code Review:</strong> #{@potential_project.type_code_review}</p>\
                <strong><p>Other:</strong> #{@potential_project.type_other}</p>\
                <strong><p>Start Timeframe:</strong> #{@potential_project.start_timeframe}</p>\
                <strong><p>Additional Information:</strong> #{@potential_project.additional_info}</p>\
                <strong><p>Heard About Us:</strong> #{@potential_project.heard_about_us}</p>\
                <strong><p>Keep Me Updated:</strong> #{@potential_project.keep_me_updated}</p>\
                <strong><p>Created At:</strong> #{@potential_project.created_at}</p>\
                </html>",
      :from_email => @potential_project.email
    }
    sending = m.messages.send message
    puts sending
  end


  def portential_project_request_params
    params.require(:potential_project).permit(:id, :name, :email, :project_idea, :phone, :company_name,
                                              :project_idea, :type_website, :type_ruby_on_rails, :type_web_design,
                                              :type_code_review, :type_other, :start_timeframe,
                                              :additional_info, :heard_about_us, :keep_me_updated)
  end

end
