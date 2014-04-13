require 'rails/generators'

module F7
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc "This generator installs Framework7 to Asset Pipeline"
      
      def add_assets
        js_manifest = 'app/assets/javascripts/application.js'
        
        if File.exist?(js_manifest)
          insert_into_file js_manifest, "//= require framework7\n", :before => "//= require jquery\n"
        else
          copy_file "application.js", js_manifest
        end
        
        css_manifest = 'app/assets/stylesheets/application.css'
        
        if File.exist?(css_manifest)
          insert_into_file css_manifest, " *= require framework7\n", :after => "require_self\n"
        else
          copy_file "application.css", css_manifest
        end
      end
    end
  end
end
