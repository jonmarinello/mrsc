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

class Recommendation < ActiveRecord::Base
  validates_presence_of(:name)
  validates_presence_of(:title)
  validates_presence_of(:body)
  validates_presence_of(:image_url)

  acts_as_list

  scope :ordered_recommendations, -> { Recommendation.order(:position).all }
end
