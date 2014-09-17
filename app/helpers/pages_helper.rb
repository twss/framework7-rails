module PagesHelper
  @pages = []

  def f7_pages(options = {}, &block)
    @pages = []
    css_classes = ['pages']
    css_classes << "navbar-#{options[:navbar]}" if options[:navbar]
    css_classes << "toolbar-#{options[:toolbar]}" if options[:toolbar]
    options[:class] = css_classes + ([options[:class]] || [])

    options.reject! { |k, v| [:navbar, :toolbar].include? k } 

    content_tag :div, options do
      yield if block_given?
    end
  end
  
  
  
  def f7_page(name, options = {}, &block)
    @pages << name
    @no_bar = []
    current_view = (@current_view).underscore
    layout = options[:layout] || false
    css_classes = ['page']

    css_classes << bar_classes_for(options[:padding]) unless options[:padding].nil?
    css_classes += [options[:class]] if options[:class]

    options.reject! { |k, v| [:class, :layout, :padding].include? k }
    options[:class] = css_classes.uniq
    
    content_tag :div, options, 'data-page' => name do
      if block_given?
        yield
      else
        render :partial => "#{controller.controller_path}/#{current_view}/#{name}", :layout => layout
      end
    end
  end
  
  private
  
  def bar_classes_for(padding)
    padding = [padding].flatten
    classes = []
    toolbar_pad = nil

    if padding.include? :no_navbar
      classes << 'no-navbar'
    elsif padding.include? :navbar
      classes << 'navbar'
    end

    if padding.include? :no_toolbar
      classes << 'no-toolbar'
    elsif padding.include? :tabbar_labels
      classes << 'tabbar-labels-fixed'      
    elsif padding.include? :toolbar
      classes << 'toolbar-fixed'
    end
    
    classes.join(' ')
  end
  
end
