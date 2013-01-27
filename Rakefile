require 'rake'
require 'rspec/core/rake_task'

task :play do
  ruby "lib/play_farkle.rb"
end

RSpec::Core::RakeTask.new(:spec)

task :default => :play
