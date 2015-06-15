require 'pry'
require 'action_view/common_methods'
require 'active_support/concern'

module Waiable
  module Base
    module CheckBox
      extend ActiveSupport::Concern
      include CommonMethods

      included do
        
def render
          options = @options.stringify_keys
          options["type"]     = "checkbox"
          options["value"]    = @checked_value
          options["checked"] = "checked" if input_checked?(object, options)
options["aria"] = {}
options["aria"]["required"] = true if required_field?(@method_name) == true
add_aria_labelledby_for_values(@checked_value, options)
add_aria_describedby_values(options)
          if options["multiple"]
            add_default_name_and_id_for_value(@checked_value, options)
            options.delete("multiple")
          else
            add_default_name_and_id(options)
          end

          include_hidden = options.delete("include_hidden") { true }
          checkbox = tag("input", options)

          if include_hidden
            hidden = hidden_field_for_checkbox(options)
            hidden + checkbox
          else
            checkbox
          end
        end

	       end
      end
    end
	 end


[
ActionView::Helpers::Tags::CheckBox
].each do |t|
t.send :include, Waiable::Base::CheckBox
end
