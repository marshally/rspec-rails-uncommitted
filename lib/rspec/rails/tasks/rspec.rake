require 'rspec/core'
require 'rspec/core/rake_task'

# FIXME: these two settings are duplicated from rspec-rails
orm_setting = Rails.configuration.generators.options[:rails][:orm]
spec_prereq = if(orm_setting == :active_record)
  Rails.configuration.active_record[:schema_format] == :sql ? "db:test:clone_structure" : "db:test:prepare"
else
  :noop	
end

def uncommitted
  # cribbed from rails/railties/lib/rails/test_unit/testing.rake
  if File.directory?(".svn")
    changed_since_checkin = silence_stderr { `svn status` }.split.map { |path| path.chomp[7 .. -1] }
  elsif File.directory?(".git")
    changed_since_checkin = silence_stderr { `git ls-files --modified --others` }.split.map { |path| path.chomp }
  else
    abort "Not a Subversion or Git checkout."
  end
end

namespace :spec do
  desc "Run uncommitted specs"
  RSpec::Core::RakeTask.new(:uncommitted => spec_prereq) do |t|
    changed = uncommitted

    puts changed.inspect
    
    models      = changed.select { |path| path =~ /app[\\\/]models[\\\/].*\.rb$/ }
    controllers = changed.select { |path| path =~ /app[\\\/]controllers[\\\/].*\.rb$/ }

    unit_tests       = models.map { |model| "spec/models/#{File.basename(model, '.rb')}_spec.rb" }
    functional_tests = controllers.map { |controller| "spec/controllers/#{File.basename(controller, '.rb')}_spec.rb" }
    routing_tests = controllers.map { |controller| "spec/routing/#{File.basename(controller, '.rb').gsub("controller", "routing")}_spec.rb" }
    # Someone who thinks that view testing is awesome should probably write code for handling view specs.

    specs_to_run = (unit_tests + functional_tests).uniq.select { |file| File.exist?(file) }
    
    puts specs_to_run.inspect
    t.pattern = specs_to_run
  end
end

