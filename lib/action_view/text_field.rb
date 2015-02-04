require 'pry'

module Waiable
  module Base
    module TextField
      def add_default_name_and_id(options)
        super
        options["aria-labelledby"] = "label_#{options["id"]}"
	if options["maxlength"]
	  options["aria-describedby"] = "maxlength_#{options["id"]}"
	end
      end

      def wrap_element(options)
        html_options = {id: "maxlength_#{options["id"]}", value: "You can enter maximum " + options["maxlength"] + " characters in this field"}
        tag("div", html_options)
      end
    end
  end
end



[ 
	ActionView::Helpers::Tags::TextField,
	ActionView::Helpers::Tags::TextArea
].each do |t|
	t.send :include, Waiable::Base::TextField
end
