require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:title)
  should validate_presence_of(:body)
  should validate_presence_of(:image_url)
end
