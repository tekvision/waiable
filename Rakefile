require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  #add more <dir>/<file> patterns by adding params to the new method below
  t.test_files = FileList.new('test/test_*.rb', 'test/integration/test_*.rb')
end

task :default => :test
