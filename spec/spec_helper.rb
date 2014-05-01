require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_group 'Core', 'lib/goose/core'
  add_group 'Web', 'lib/goose/web'
end

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }
Dir[File.dirname(__FILE__) + '/steps/**/*_steps.rb'].each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.include WebSupport, web: true
  config.include CoreSupport, core: true
end
