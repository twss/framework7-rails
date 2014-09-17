module ToolbarHelper

  def f7_toolbar_item(title_or_options, options=nil, &block)
    output = []
    if title_or_options.class == Hash
      options = title_or_options if options.nil?
      title = options[:title]
    else
      title = title_or_options
    end
    title ||= capture(&block) if block_given?

    href = options[:href] || '#'

    css_classes = []
    css_classes << (@is_tabbar ? 'tab-link' : 'link')
    css_classes += [options[:class]] if options[:class]

    if @is_tabbar
      if options.has_key? :icon
        content_tag :a, :href => href, :class => css_classes do
          if options[:badge]
            if options[:badge].kind_of? Hash
              badge_data = options[:badge]
              badge_classes = [:badge]
              badge_classes << badge_data[:class]
              badge = content_tag :span, badge_data[:text], :class => badge_classes
            else
              badge = content_tag :span, options[:badge], :class => [:badge, 'badge-red']
            end
            link = link_icon_i(options[:icon], badge)
          else
            link = link_icon_i(options[:icon])              
          end
          output << link
          output << content_tag(:span, title, :class => 'tabbar-label') if @has_labels && !title.blank?
          output.join("\n").html_safe
        end
      else
        content_tag :a, title, :href => href, :class => css_classes
      end
    else
      content_tag :a, title, :href => href, :class => css_classes
    end
  end

  private

  def link_icon_i(icon, badge = '')
    content_tag :i, badge, :class => ['icon', icon]
  end
end
