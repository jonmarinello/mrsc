# == Schema Information
#
# Table name: recommendations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  title      :string           not null
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#  image_url  :string           default(""), not null
#  position   :integer
#

require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:title)
  should validate_presence_of(:body)
  should validate_presence_of(:image_url)

  test 'test ordered_recommendations scope' do
    assert_equal 2, Recommendation.ordered_recommendations.count
  end
end
