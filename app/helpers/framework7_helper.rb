module Framework7Helper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize if Rails.const_defined?("#{object.class}Presenter")
    klass ||= "Framework7::#{object.class.name.demodulize}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  # def f7_link(name = nil, options = nil, html_options = nil, &block)
  #   if name.blank?
  #     if html_options[:class]
  #       html_options[:class] = ['link', 'icon-only'].merge!(html_options[:class])
  #     else
  #       html_options[:class] = ['link', 'icon-only']
  #     end

  #     if options[:icon]
  #       icon = options[:icon]
  #       name = content_tag(:i, '', :class => ['icon', "icon-#{icon}"])
  #       options.reject! { |k, v| k == :icon }
  #     end
  #   else
  #     link_to name, options, html_options, block
  # end
end
