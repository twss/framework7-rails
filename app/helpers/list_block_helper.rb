module ListBlockHelper
  
  def f7_list_block(*args, &block)
    output = []
    title = nil
    options = {}
    if args.count > 0
      if (args.first.kind_of?(String) || args.first.kind_of?(Symbol))
        title = args.first
        options = args.second || {}
      elsif arg.first.kind_of? Hash
        options = args.first
        title = options[:title]
        options = options.reject{ |k,v| k == :title }
      end
    end
    list_block_div(options) do
      concat content_block_title_div(title) unless title.blank?
      concat list_block_ul(&block)
      concat list_block_label(options) unless options[:label].blank?
    end
  end
  
  
  def f7_list_divider(title_or_options, options = nil, &block)
    if title_or_options.class == Hash
      options = title_or_options if options.nil?
      title_or_options = options[:title]
    end
    title = title_or_options

    content_tag :li do
      content_tag :div, title, :class => ['item-divider']
    end
  end
  
  
  
  def f7_list_group(title_or_options, options = nil, &block)
    if title_or_options.class == Hash
      options = title_or_options if options.nil?
      title_or_options = options[:title]
    end
    title = title_or_options

    content_tag :div, :class => ["list-group"] do
      concat list_group_title title unless title.blank?
      yield if block_given?
    end
  end
  
  
  def f7_list_group_title(title, options = {}, &block)
    list_group_li(title, options)
  end
  
  
  
  def f7_list_item(title, options = {}, &block)
    content_tag :li do
      css_classes = ["item-content"]
      tag = options[:href] ? :a : :div
      css_classes << "item-link" if tag == :a
      css_classes.concat(options[:class]) if options[:class]
      
      tag_options = options.reject { |k, v| [:title, :icon, :after].include? k }
      tag_options[:class] = css_classes
      
      content_tag tag, tag_options do
        concat list_icon_i(options[:icon]) if options[:icon]
        concat list_item_inner(title, options)
      end
    end
  end  
  
  
  
  private
  
  def list_block_div(options={}, &block)
    output = []
    css_classes = ["list-block"]
    if options[:format]
      format = [options[:format]].flatten.map { |v| v.to_sym }
      if format.include? :inset
        css_classes << "inset"
      elsif format.include? :tablet_inset
        css_classes << "tablet-inset"
      end
    end
    css_classes += [options[:class]] if options[:class]
    
    block_options = options.reject { |k, v| [:class, :format, :label].include? k }
    block_options[:class] = css_classes.uniq
    
    content_tag :div, block_options do
      output << capture(&block) if block_given?
      output.join("\n").html_safe
    end
  end
  
  
  
  def list_block_ul(&block)
    content_tag :ul do
      yield if block_given?
    end
  end
  
  
  
  def list_group_title(title, options={})
    content_tag :li, title, :class => ["list-group-title"]
  end
  
  
  
  def list_item_inner(title, options={})
    content_tag :div, :class => ["item-inner"] do
      concat content_tag :div, title, :class => ["item-title"]
      concat list_item_inner_div(options)
    end
  end
  
  
  
  def list_item_inner_div(options={}, &block)
    if options[:after] || options[:badge]
      content_tag :div, :class => ['item-after'] do
        if options[:after]
          if options[:after].kind_of? Hash
            after = options[:after].first
            case after[0].to_sym
            when :icon
              klass = "icon #{after[1]}"
              concat content_tag(:span, '', :class => klass)
            when :badge
              badge_or_options = after[1]
              if badge_or_options.kind_of? Hash
                badge_data = badge_or_options
                badge_classes = [:badge]
                badge_classes << badge_data[:class] unless badge_data[:class].blank?
                badge = content_tag :span, badge_data[:text], :class => badge_classes
              else
                badge = content_tag :span, badge_or_options, :class => [:badge, 'badge-red']
              end
            when :text
              concat after[1]
            end
          else
            concat "#{options[:after]}"
          end
        end
      end
    end
  end
  
  
  
  def list_item_badge(value, options={})
    content_tag :span, value, :class => ["badge"]
  end
  
  
  
  def list_icon_i(icon)
    content_tag :div, :class => ['item-media'] do
      content_tag :i, '', :class => ['icon', icon]
    end
  end
  
  
  
  def list_block_label(options={}, &block)
    content_tag :div, :class => "list-block-label" do
      content_tag :p, options[:label] if options[:label]
    end
  end
  
end
