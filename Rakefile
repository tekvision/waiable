require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  #add more <dir>/<file> patterns by adding params to the new method below
  #t.test_files = FileList.new('test/test_*.rb', 'test/integration/test_*.rb', 'test/action_view/helpers/test_*.rb')
  t.test_files = FileList.new('test/test_*.rb', 'test/action_view/helpers/*_test.rb')
end

task :default => :test
