class Framework7::BasePresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def h
    @template
  end

  def method_missing(*args, &block)
    if @template.respond_to? args.first
      @template.send(*args, &block)
    else
      @object.send(*args, &block)
    end
  end
end
