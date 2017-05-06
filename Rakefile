require "bundler/gem_tasks"
require "rake/testtask"
require "rdoc/task"

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_dir = "rdoc"
  rdoc.title    = "RTime"
  rdoc.markup = "markdown"
  rdoc.options << "--line-numbers"
  rdoc.rdoc_files.include("README.md")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test
