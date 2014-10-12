class Recommendation < ActiveRecord::Base
  validates_presence_of(:name)
  validates_presence_of(:title)
  validates_presence_of(:body)
  validates_presence_of(:image_url)
end
