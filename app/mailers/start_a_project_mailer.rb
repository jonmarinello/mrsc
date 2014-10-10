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
          'PHONE' => ActiveSupport::NumberHelper.number_to_phone(potential_project.phone, area_code: true),
          'COMPANY_NAME' => potential_project.company_name,
          'PROJECT_IDEA' => potential_project.project_idea,
          'WEBSITE' => boolean_to_string(potential_project.type_web_design),
          'RUBY_ON_RAILS' => boolean_to_string(potential_project.type_ruby_on_rails),
          'WEBSITE_DESIGN' => boolean_to_string(potential_project.type_web_design),
          'CODE_REVIEW' => boolean_to_string(potential_project.type_code_review),
          'OTHER' => boolean_to_string(potential_project.type_other),
          'START_TIMEFRAME' => potential_project.start_timeframe,
          'ADDITIONAL_INFORMATION' => potential_project.additional_info,
          'HEARD_ABOUT_US' => potential_project.heard_about_us,
          'KEEP_ME_POSTED' => boolean_to_string(potential_project.keep_me_updated),
          'CREATED_AT' => potential_project.created_at,
      },
      important: true,
      inline_css: true
  end

  private

  def boolean_to_string(value)
    return 'yes' if value == true
    return 'no' if value == false
    "unknown value --> #{value.inspect}"
  end
end
