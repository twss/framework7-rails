module ViewsHelper
  @current_view = nil
  @views_defined = false
  
  def f7_views(*args, &block)
    return if @views_defined
    @views_defined = true
    @current_view = nil
    
    content_tag :div, :class => ['views'] do
      yield if block_given?
    end
  end
  
  
  
  def f7_view(name, html_options = {}, &block)
    name = name.to_s.gsub(/view-/,'')
    @current_view = name
    
    view_name = "view-#{name}"
    
    css_classes = ['view']
    css_classes << view_name
    html_options[:class] = css_classes + ([html_options[:class]] || [])
    
    content_tag :div, html_options do
      if block_given?
        yield
      else
        render :partial => "#{controller.controller_path}/#{name}/#{name}", :layout => false
      end
    end
  end
  
end
