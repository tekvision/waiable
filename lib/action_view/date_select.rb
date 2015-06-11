require 'pry'
require 'action_view/common_methods'
require 'active_support/concern'

module Waiable
  module Base
    module DateSelect
      extend ActiveSupport::Concern
      include CommonMethods

      included do
        def render
          html_options = @html_options.stringify_keys
          html_options["aria"] ||= {}
          html_options["aria"]["required"] = true if required_field?(@method_name) == true
          html_options["aria"]["labelledby"] = "label_#{add_default_name_and_id(html_options)}"
         add_aria_describedby_values(html_options)
          @html_options = html_options      
                    error_wrapping(datetime_selector(@options, @html_options).send("select_#{select_type}").html_safe)
        end

      end
    end
  end
end


[
ActionView::Helpers::Tags::DateSelect
].each do |t|
t.send :include, Waiable::Base::DateSelect
end
