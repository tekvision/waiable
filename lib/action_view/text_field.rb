#require 'pry'
require 'action_view/common_methods'
require 'active_support/concern'

module Waiable
  module Base
    module TextField
      extend ActiveSupport::Concern
      include CommonMethods

      included do
        def render
          options_for_rendering
          aria_content(@options)
        end
      end   
      
      def aria_content(options)        
	aria = ""        
	if options["maxlength"]
          aria = tag("input", options) + content_tag(:div,  "You can enter maximum " + options["maxlength"] + " characters in this field", id: "maxlength_#{options["id"]}", style: "display:none")
        else
          aria = tag("input", options)
	end
        aria
      end
    end
  end
end



[ 
	ActionView::Helpers::Tags::TextField,
        ActionView::Helpers::Tags::EmailField,
        ActionView::Helpers::Tags::PasswordField,
        ActionView::Helpers::Tags::DatetimeField,
        ActionView::Helpers::Tags::FileField,
        ActionView::Helpers::Tags::NumberField,
        

#	ActionView::Helpers::Tags::TextArea
].each do |t|
	t.send :include, Waiable::Base::TextField
end
