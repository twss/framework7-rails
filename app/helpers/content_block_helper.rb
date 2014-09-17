module ContentBlockHelper

  def f7_content_block(*args, &block)
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
        options = options.reject { |k,v| k == :title }
      end
    end
    output << content_block_title_div(title) unless title.nil?
    output << content_block_div(options) do
      yield if block_given?
    end
    output.join("\n").html_safe
  end



  private

  def content_block_div(options, &block)
    format = []
    output = []
    css_classes = []
    css_classes << "content-block"

    if options[:format]
      format = [options[:format]].flatten!.map { |v| v.to_sym }
      if format.include? :inset
        css_classes << "inset"
      elsif format.include? :tablet_inset
        css_classes << "tablet-inset"
      end
    end
    css_classes += [options[:class]] if options[:class]

    options.reject! { |k, v| [:class, :format].include? k }
    options[:class] = css_classes.uniq

    content_tag :div, options do
      if format.include? :inner
        content_tag :div, :class => [ 'content-block-inner' ] do
          output << capture(&block) if block_given?
          output.join("\n").html_safe
        end
      else
        output << capture(&block) if block_given?
        output.join("\n").html_safe
      end
    end
  end



  def content_block_title_div(title)
    content_tag :div, title, :class => [ 'content-block-title' ]
  end

end
