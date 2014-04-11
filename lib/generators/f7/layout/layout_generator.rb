require 'rails/generators'

module F7
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'This generator generates layout file with navigation.'
      argument :layout_name, :type => :string, :default => 'application'
      
      attr_reader :app_name, :container_class
      
      def generate_layout
        app = ::Rails.application
        @app_name = app.class.to_s.split("::").first
        ext = app.config.generators.options[:rails][:template_engine] || :erb
        template "layout.html.#{ext}", "app/views/layouts/#{layout_name}.html.#{ext}"
        template "app.js.coffee.erb", "app/assets/javascripts/#{@app_name.underscore}.js.coffee"
        
        insert_into_file "app/assets/javascripts/application.js", :before => %r{//= require +['"]?jquery['"]?$} do
          "//= require 'framework7'\n"
        end
        
        insert_into_file "app/assets/stylesheets/application.css", :before => "*/" do
          " *= require 'framework7'\n"
        end
      end
    end
  end
end
