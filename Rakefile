require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :default => ['spec:unit', 'spec:acceptance']

namespace :spec do
  
  [:acceptance, :unit].each do |suite|
    desc "Run the #{suite} specs"
    RSpec::Core::RakeTask.new(suite) do |t|
      t.pattern = "./spec/#{suite}/**/*_spec.rb"
    end
  end
  
end