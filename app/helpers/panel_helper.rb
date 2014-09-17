module PanelHelper

  def f7_panel(*args, &block)
    options = args.first || {}

    panel_div(options)
  end

  private

  def panel_div(options = {}, &block)
    output = []
    css_classes = ['panel']
    css_classes << "panel-#{options[:side]}" if options[:side]
    css_classes << "panel-#{options[:show]}" if options[:show]
    css_classes += options[:class] if options[:class]
    css_classes.uniq!
    
    opts = { :class => css_classes }
    opts[:id] = options[:id] if options[:id]

    content_tag :div, opts do
      output << capture(&block) if block_given?
      output.join("\n").html_safe
    end
  end
end