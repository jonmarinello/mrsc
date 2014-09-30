require 'test_helper'

class PotentialProjectTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_presence_of(:project_idea)
end
