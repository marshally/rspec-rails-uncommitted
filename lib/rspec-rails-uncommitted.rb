module Rspec
  module Rails
    module Uncommitted
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load "rspec/rails-uncommitted/tasks/rspec.rake"
        end
      end
    end
  end
end
