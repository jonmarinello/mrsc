# Preview all emails at http://localhost:3000/rails/mailers/new_potential_project_mailer
class NewPotentialProjectMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_potential_project_mailer/new_potential_project
  def new_potential_project
    NewPotentialProjectMailer.new_potential_project
  end

end
