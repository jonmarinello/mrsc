# == Schema Information
#
# Table name: potential_projects
#
#  id                                 :integer          not null, primary key
#  name                               :string           not null
#  email                              :string           not null
#  phone                              :string
#  company_name                       :string
#  project_idea                       :text             not null
#  type_ruby_on_rails_web_development :boolean
#  type_cms_web_development           :boolean
#  type_mobile_app_development        :boolean
#  type_everything_cloud              :boolean
#  type_other                         :boolean
#  start_timeframe                    :string
#  additional_info                    :text
#  heard_about_us                     :string
#  keep_me_updated                    :boolean
#  created_at                         :datetime
#  updated_at                         :datetime
#  is_active                          :boolean          default(TRUE), not null
#  type_ux_prototyping                :boolean
#  type_agile_development             :boolean
#

class PotentialProject < ActiveRecord::Base
  validates_presence_of(:name)
  validates_presence_of(:email)
  validates_presence_of(:project_idea)
  validates :email, email_format:  { message: 'invalid email address' }
  validates_email_realness_of :email
  phony_normalize :phone, default_country_code: 'US'
  validates :phone, phony_plausible: true

  scope :active, -> {where(is_active: true)}
end
