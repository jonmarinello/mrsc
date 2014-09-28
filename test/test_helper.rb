ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


#
# Code under test sometimes logs information to STDOUT and it can be suppressed. To suppress STDOUT in your tests,
# wrap your code under test like this:
#
# silence_stream(STDOUT) do
#   <your test code goes here>
# end
#
# If you need to debug a failure and want to see the logged output just run 'export SHOW_STDOUT=1' on the command line
# and rerun the test.
#
if ENV['SHOW_STDOUT'] && ENV['SHOW_STDOUT'] == '1'
  def silence_stream(stream, &block)
    yield
  end
end


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
