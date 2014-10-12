# This task is normally run via the Heroku Task Scheduler.
#
# See https://github.com/finandfield/finandfield/wiki/Listing-Activity-Scheduler-Design for details.
#
require 'recommendation_loader'

namespace :db do
  desc 'Loads recommendations'
  task :load_recommendations => [:environment] do
    RecommendationsLoader.load_recommendations
  end
end
