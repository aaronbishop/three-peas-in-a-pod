# frozen_string_literal: true
# Idle by default; only runs for JS/system tests.
# When you add JS/system specs, also set `config.use_transactional_fixtures = false` in rails_helper.rb.

RSpec.configure do |config|
  # Ensure a clean slate across the whole suite
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }

  # Use truncation ONLY for JS/system tests (multi-process)
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after(:each, js: true) do
    DatabaseCleaner.clean
  end
end