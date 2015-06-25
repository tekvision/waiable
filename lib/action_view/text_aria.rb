#require 'pry'
require 'active_support/concern'
require 'action_view/common_methods'

module Waiable
  module Base
    module TextAria
      extend ActiveSupport::Concern
      include CommonMethods

      included do
        def render
          options = @options.stringify_keys
          add_default_name_and_id(options)

          if size = options.delete("size")
            options["cols"], options["rows"] = size.split("x") if size.respond_to?(:split)
          end

          options["aria"] ||= {}
          options["aria"]["required"] = true if required_field?(@method_name) == true
          add_aria_describedby_values(options)
          aria_content_tag(options)          
        end
      end 

      def aria_content_tag(options)
        aria= ""
        if options["maxlength"]          
          aria= content_tag("textarea", options.delete("value") { value_before_type_cast(object) }, options) + content_tag(:div, "You can enter maximum " +options["maxlength"]+ " characters in this field.", id: "maxlength_#{options["id"]}", style: "display:none")
        else
          aria= content_tag("textarea", options.delete("value") { value_before_type_cast(object) }, options)
        end
        aria
      end


    end
  end
end

[
  ActionView::Helpers::Tags::TextArea
].each do |t|
  t.send :include, Waiable::Base::TextAria
end
