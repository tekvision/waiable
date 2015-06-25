require 'rails/railtie'
module Waiable
  class Railtie < ::Rails::Railtie
    initializer "waiable.helpers" do |app|
      ActiveSupport.on_load :action_view do
      end
    end
  end
end

