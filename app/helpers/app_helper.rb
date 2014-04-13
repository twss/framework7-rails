module AppHelper
  # Provides the skeleton application layout ready to be customised
  def f7_app(options={}, &block)
    output = []
    output << statusbar_overlay_div
    output << panel_overlay_div
    output << capture(&block)
    
    output.join("\n").html_safe
  end
  
  private
  
  def statusbar_overlay_div
    content_tag :div, '', :class => ["statusbar-overlay"]
  end
  
  def panel_overlay_div
    content_tag :div, '', :class => ["panel-overlay"]
  end
  
end
