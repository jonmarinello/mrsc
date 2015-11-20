class NewPotentialProjectMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  layout 'mailers/new_potential_project_mailer/layout'

  default from: 'donotreply@mrsc.com'

  def new_potential_project(potential_project)
    @potential_project = potential_project

    mail(
        to: 'jonmarinello@gmail.com',
        subject: 'New potential project'
    )
  end
end
