class Recommendation < ActiveRecord::Base
  validates_presence_of(:name)
  validates_presence_of(:title)
  validates_presence_of(:body)
end
