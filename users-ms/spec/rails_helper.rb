require 'spec_helper'
  
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'vcr'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }
Dir[Rails.root.join('spec/fixtures/*.rb')].each { |file| require file }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => error
  puts error.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
    Sidekiq::Worker.clear_all
  end

  config.before(:each, type: :request) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    Sidekiq::Worker.clear_all
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  config.mock_with :rspec
end


# =============== CONFIGURE VCR ===============
VCR.configure do |config|
  config.default_cassette_options = { record: :once, erb: true, decode_compressed_response: true }
  config.cassette_library_dir = 'spec/support/vcr_cassettes'
  config.allow_http_connections_when_no_cassette = true
  config.configure_rspec_metadata!
  config.hook_into :webmock

  config.before_record do |spec|
    spec.response.body.force_encoding('UTF-8')
  end
end


# ============== CUSTOM MATCHERS ===============
RSpec::Matchers.define_negated_matcher :not_change, :change