# I can either run the tests using rake or bundle exec rspec.
require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task default: :spec

desc "Run the War card game"
task :run do
  sh "ruby bin/war"
end
