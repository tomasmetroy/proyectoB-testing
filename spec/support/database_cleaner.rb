require 'database_cleaner'
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :deletion
    DatabaseCleaner[:active_record].clean_with(:deletion)
  end

  config.before(:all) do
    DatabaseCleaner.start unless ENV['NO_AFTER_CLEAN_DB'].present?
  end

  config.after(:all) do
    DatabaseCleaner.clean unless ENV['NO_AFTER_CLEAN_DB'].present?
  end

  config.after(:suite) do
    unless ENV['NO_AFTER_CLEAN_DB'].present?
      FileUtils.rm_rf(Dir["#{Rails.root}/tmp/storage/*"])
    end
  end
end
