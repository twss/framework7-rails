module BarHelper
  
  @f7_bartype = nil
  @has_labels = false
                            
  def f7_navbar(html_options={}, &block)
    @f7_bartype = :navbar
    
    html_options[:class] = ([html_options[:class]] || []) << @f7_bartype
    
    content_tag :div, html_options do
      content_tag :div, :class => ['navbar-inner'] do
        yield if block_given?
      end
    end
  end
  
  def f7_toolbar(options={}, &block)
    @f7_bartype = :toolbar
    css_classes = []
    css_classes << @f7_bartype
    css_classes += [options[:class]] if options[:class]
    css_classes.flatten!

    @f7_bartype = :tabbar if options[:type].to_s.include?('tabbar')

    if @f7_bartype == :tabbar
      css_classes << 'tabbar'
      if options[:type] == :tabbar_labels
        css_classes << 'tabbar-labels'
        @has_labels = true
      end
    end
    options[:class] = css_classes
    div_options = options.reject { |k, v| [:type].include? k }

    content_tag :div, div_options do
      content_tag :div, :class => ['toolbar-inner'] do
        yield if block_given?
      end

    end
  end

end
