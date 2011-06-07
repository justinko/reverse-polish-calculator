require 'rubygems'
require 'bundler'
Bundler.setup

require 'reverse-polish-calculator'
require 'aruba/api'

Dir['./spec/support/*.rb'].map {|f| require f}

RSpec.configure do |config|
  config.color_enabled = true
  config.include Aruba::Api, :example_group => {
    :file_path => /spec\/acceptance/
  }
  config.before(:suite, :example_group => {
    :file_path => /spec\/unit/
  }) { $in_unit_spec_suite = true }
end