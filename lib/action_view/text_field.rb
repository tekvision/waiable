require 'pry'
require 'active_support/concern'
#require '/waiable/test/support/person'

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
        options["aria-required"] = true if required_field?(@method_name)
        #The following method can be overridden separately
        #to generate aria-describedby="maxlength_person_first_name" for the <input ... /> field
	if options["maxlength"]
	  options["aria-describedby"] = "maxlength_#{add_default_name_and_id(options)}"
	end
        @options = options
        add_default_name_and_id(@options)
      end

      def required_field?(field)
        object_class = @object_name.classify.constantize
        if object_class.respond_to?(:validators_on)
          object_class.validators_on(field.intern).detect do |validator|
            if validator.is_a? ActiveModel::Validations::PresenceValidator
              validator.is_a? ActiveModel::Validations::PresenceValidator
            elsif validator.is_a? Mongoid::Validatable::PresenceValidator
              validator.is_a? Mongoid::Validatable::PresenceValidator
            end
          end.present?
        end
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
        ActionView::Helpers::Tags::EmailField,
        ActionView::Helpers::Tags::PasswordField,
        ActionView::Helpers::Tags::DatetimeField,

#	ActionView::Helpers::Tags::TextArea
].each do |t|
	t.send :include, Waiable::Base::TextField
end
