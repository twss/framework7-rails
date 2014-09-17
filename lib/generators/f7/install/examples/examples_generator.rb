require 'rails/generators'

module F7
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'This generator creates an example application.'

      empty_directory "app/assets/javascripts/views"
      create_file "app/assets/javascripts/views/.gitkeep"
      
      directory "app"
      
      route "get 'examples(/:action)' => 'examples#index', :as => 'examples'"
    end
  end
end
