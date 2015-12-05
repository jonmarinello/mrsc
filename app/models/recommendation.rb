class Recommendation < ActiveRecord::Base
  validates_presence_of(:name)
  validates_presence_of(:title)
  validates_presence_of(:body)
  validates_presence_of(:image_url)

  acts_as_list

  scope :ordered_recommendations, -> { Recommendation.order(:position).all }
end
