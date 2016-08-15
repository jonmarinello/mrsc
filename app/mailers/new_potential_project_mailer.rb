class NewPotentialProjectMailer < ApplicationMailer
  def new_potential_project(potential_project)
    @potential_project = potential_project

    mail(
        to: 'jonmarinello@gmail.com',
        subject: 'New potential project'
    )
  end
end
