module Framework7
end

if defined?(Rails)
  ActionController::Base.send(:helper, Framework7Helper)
end
