require 'rake/clean'
require 'rspec/core/rake_task'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "sinatra-cell"
  gem.version = "0.1.1"
  gem.summary = "Renderable cells in Sinatra's DSL style."
  gem.description = "Sinatra extension for using separated components declared using a syntax similar to Sinatra's DSL."
  gem.email = "shferreira@me.com"
  gem.homepage = "http://github.com/shf/sinatra-cell"
  gem.authors = [ "Silvio Henrique Ferreira" ]
  gem.add_dependency "sinatra", ">= 1.0.0"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "rcov"
  gem.add_development_dependency "jeweler"
end
Jeweler::GemcutterTasks.new

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
  t.rcov = true
  t.rcov_opts = ['--exclude', 'gems/']
end
