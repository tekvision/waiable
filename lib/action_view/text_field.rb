require 'pry'
require 'active_support/concern'

module Waiable
  module Base
    module TextField
      extend ActiveSupport::Concern

      included do
        def render
          options_for_rendering
          aria_content(tag("input", @options))
        end
      end

      def add_default_name_and_id(options)
        super
        options["aria-labelledby"] = "label_#{options["id"]}"
      end

      def options_for_rendering
        options = @options.stringify_keys
        options["size"] = options["maxlength"] unless options.key?("size")
        options["type"] ||= field_type
        options["value"] = options.fetch("value") {value_before_type_cast(object) } unless field_type == "file"
        #The following method can be overridden separately
        #to generate aria-describedby="maxlength_person_first_name" for the <input ... /> field
#        options["aria-labelledby"] = "label_#{options["id"]}"
	if options["maxlength"]
	  options["aria-describedby"] = "maxlength_#{add_default_name_and_id(options)}"
	end
        @options = options
        add_default_name_and_id(@options)
      end

      def aria_content(content)
	aria = ""        
	if @options["maxlength"]
          aria = tag("div", {id: "maxlength_#{@options["id"]}", value: "You can enter maximum " + @options["maxlength"] + " characters in this field"})
	end
        content + aria
      end
    end
  end
end



[ 
	ActionView::Helpers::Tags::TextField,
#	ActionView::Helpers::Tags::TextArea
].each do |t|
	t.send :include, Waiable::Base::TextField
end
