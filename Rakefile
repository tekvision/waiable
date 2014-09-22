require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/test_*.rb', 'test/integration/test_*.rb', 'test/widgets/test_*.rb'']
end

task :default => :test
