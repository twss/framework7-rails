require 'rails/generators'

module F7
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'This generator creates a bare Framework7 layout.'
      argument :layout_name, :type => :string, :default => 'application'
      
      attr_reader :app_name, :container_class
      
      def generate_layout
        app = ::Rails.application
        @app_name = app.class.to_s.split("::").first
        ext = :erb
        
        template "layout.html.#{ext}", "app/views/layouts/#{layout_name}.html.#{ext}"
        
        ext = use_coffeescript? ? :coffee : :js
        if layout_name.eql? 'application'
          template "setup.#{ext}", "app/assets/javascripts/setup.#{ext}"
        else
          touch "app/assets/javascripts/#{layout_name}.#{ext}"
        end
      end

      private
      
      def use_coffeescript?
        return false if options[:'no-coffeescript']
        ::Rails.configuration.app_generators.rails[:javascript_engine] == :coffee
      end
    end
  end
end
