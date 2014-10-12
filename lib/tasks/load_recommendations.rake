# This task will load the default recommendations
#
require 'recommendation_loader'

namespace :db do
  desc 'Loads recommendations'
  task :load_recommendations => [:environment] do
    RecommendationsLoader.load_recommendations
  end
end
