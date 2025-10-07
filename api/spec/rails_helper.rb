# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

# Start coverage tracking *before* Rails loads
require 'simplecov'

SimpleCov.start "rails" do
  add_filter %w[spec config bin]
  enable_coverage :branch
  if ENV['CI']
    SimpleCov.minimum_coverage 90
  else
    puts "⚠️ Coverage threshold enforcement disabled locally"
  end
end

require_relative '../config/environment'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Automatically load all files in spec/support/
Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|

  # ActiveRecord helpers
  config.fixture_paths = [
    Rails.root.join("spec/fixtures")
  ]

  # Use transactions for most specs///will flip to false when we add JS/system tests
  config.use_transactional_fixtures = true

  # Auto-tag spec type based on directory (models, requests, etc.)
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces
  config.filter_rails_from_backtrace!
end
