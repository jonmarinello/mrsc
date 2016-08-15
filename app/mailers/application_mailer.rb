class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  layout 'mailers/new_potential_project_mailer/layout'

  default from: 'donotreply@mrsc.com'
end
