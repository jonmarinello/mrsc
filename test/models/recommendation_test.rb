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

  describe 'test active_and_ordered scope' do
    test 'test active_and_ordered scope with all active records' do
      assert_equal 2, Recommendation.active_and_ordered.count
    end

    test 'test active_and_ordered scope with one inactive record' do
      first_recommendation = Recommendation.first
      first_recommendation.is_active = false
      first_recommendation.save!
      assert_equal 1, Recommendation.active_and_ordered.count
    end
  end
end
