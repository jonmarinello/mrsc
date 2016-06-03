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
#  is_active  :boolean          default(TRUE), not null
#

class Recommendation < ActiveRecord::Base
  validates_presence_of(:name)
  validates_presence_of(:title)
  validates_presence_of(:body)
  validates_presence_of(:image_url)

  acts_as_list

  scope :active_and_ordered, -> { Recommendation.where(:is_active => true).order(:position).all }
end
