require 'rails/railtie'
module Waiable
  class Railtie < ::Rails::Railtie
    initializer "waiable.helpers" do |app|
      ActiveSupport.on_load :action_view do
        require "waiable/helpers/grid_helper"
        include Waiable::Helpers::GridHelper
      end
    end
  end
end

