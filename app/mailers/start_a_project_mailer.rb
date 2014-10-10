require 'mandrill'

class StartAProjectMailer < MandrillMailer::TemplateMailer
  default from: 'donotreply@mrsc.com'

  def start_a_project(potential_project)
    mandrill_mail template: 'start_a_project',
      subject: 'Someone Wants To Start A Project',
      to: 'jonmarinello@gmail.com',
      vars: {
          'NAME' => potential_project.name,
          'EMAIL' => potential_project.email,
          'PHONE' => potential_project.phone,
          'COMPANY_NAME' => potential_project.company_name,
          'PROJECT_IDEA' => potential_project.project_idea,
          'TYPE_WEBSITE_DESIGN' => potential_project.type_web_design,
          'TYPE_RUBY_ON_RAILS' => potential_project.type_ruby_on_rails,
          'TYPE_WEBSITE_DESIGN' => potential_project.type_web_design,
          'TYPE_CODE_REVIEW' => potential_project.type_code_review,
          'TYPE_OTHER' => potential_project.type_other,
          'START_TIMEFRAME' => potential_project.start_timeframe,
          'ADDITIONAL_INFORMATION' => potential_project.additional_info,
          'HEARD_ABOUT_US' => potential_project.heard_about_us,
          'KEEP_ME_POSTED' => potential_project.keep_me_updated,
          'CREATED_AT' => potential_project.created_at
      },
      important: true,
      inline_css: true
  end
end
