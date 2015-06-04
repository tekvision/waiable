require 'pry'
require 'action_view/common_methods'
require 'active_support/concern'

module Waiable
  module Base
    module RadioButton
      extend ActiveSupport::Concern
      include CommonMethods

      included do
        def render
          options = @options.stringify_keys
          options["type"]     = "radio"
          options["value"]    = @tag_value
          options["checked"] = "checked" if input_checked?(object, options)
options["aria"] = {}
options["aria"]["required"] = true if required_field?(@method_name) == true
add_aria_labelledby_for_values(@tag_value, options)
add_aria_describedby_values(options)

          add_default_name_and_id_for_value(@tag_value, options)
          tag("input", options)
        end

	       end
      end
    end
	 end


[
ActionView::Helpers::Tags::RadioButton
].each do |t|
t.send :include, Waiable::Base::RadioButton
end
