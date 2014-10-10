class PotentialProject < ActiveRecord::Base
  validates_presence_of(:name)
  validates_presence_of(:email)
  validates_presence_of(:project_idea)
  validates :email, email_format: { message: 'invalid email address' }
  phony_normalize :phone, :default_country_code => 'US'
  validates :phone, :phony_plausible => true
end
