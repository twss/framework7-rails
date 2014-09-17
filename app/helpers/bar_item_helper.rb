module BarItemHelper

  def f7_bar_item(title_or_options, options=nil, &block)
    output = []
    if title_or_options.class == Hash
      options = title_or_options
      title = options[:title]
    else
      title = title_or_options
      options ||= {}
      options[:title] = title
    end

    position = (options[:position] || :left) unless @f7_bartype == :tabbar
    transition = options[:tansition]

    css_classes = []
    css_classes << position
    css_classes << [transition].flatten if options[:transition]
    options[:class] = ([options[:class]] || []) + css_classes

    html_options = options.reject { |k, v| [:position, :title].include? k }

    if block_given?
      output << capture(&block)
    else
      if options[:href]
        link_options =  options.select { |k, v| [:title, :href, :icon, :badge].include? k.to_sym }
        output << f7_bar_link(link_options)
      else
        output << title
      end
    end

    if @f7_bartype == :tabbar
      output.join("\n").html_safe
    else
      content_tag :div, :class => css_classes do
        output.join("\n").html_safe
      end
    end
  end

  def f7_bar_link(title_or_options, options=nil)
    output = []
    link_classes = []

    if title_or_options.class == Hash
      options = title_or_options
      title = options[:title]
    else
      title = title_or_options
      options ||= {}
    end

    href = options[:href] || '#'
    icon = options[:icon]

    if @f7_bartype == :tabbar
      link_classes << 'tab-link'
    else
      link_classes << :link
    end

    link_classes << 'icon-only' if title.blank? 
    options[:class] = ([options[:class]] || []) + link_classes

    link_attr = options.reject { |k, v| [:title, :icon, :badge].include? k }

    span_class = (@f7_bartype == :tabbar ? {:class => 'tabbar-label'} : nil)

    if icon.blank?
      content_tag :a, title, link_attr
    else
      badge = nil
      link_options = {}
      if @f7_bartype == :tabbar
        if options[:badge].kind_of? Hash
          badge_data = options[:badge]
          badge_classes = [:badge]
          badge_classes << badge_data[:class] unless badge_data[:class].blank?
          badge = content_tag :span, badge_data[:text], :class => badge_classes
        else
          badge = content_tag :span, options[:badge], :class => [:badge, 'badge-red']
        end
        link = link_icon_i(options[:icon], badge)
      end
      puts " has labels: #{@has_labels ? 'true' : 'false'}"
      content_tag :a, :href => href, :class => link_classes do
        output << link_icon_i(options[:icon], badge)
        output << content_tag(:span, title, span_class) if !title.blank? && @has_labels
        output.join("\n").html_safe
      end
    end
  end

  private

  def link_icon_i(icon)
    if icon
      content_tag :i, '', :class => ['icon', icon]
    end
  end

end
