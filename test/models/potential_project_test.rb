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

require 'test_helper'

class PotentialProjectTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_presence_of(:project_idea)
end
