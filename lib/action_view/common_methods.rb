require 'pry'
require 'active_support/concern'

module Waiable
  module CommonMethods
    extend ActiveSupport::Concern


    TAG_PREFIXES = ['aria', 'data', :aria, :data].to_set

      
    def options_for_rendering
      options = @options.stringify_keys
      options["size"] = options["maxlength"] unless options.key?("size")
      options["type"] ||= field_type
      options["value"] = options.fetch("value") {value_before_type_cast(object) } unless field_type == "file"
      options["aria"] ||= {}
      options["aria"]["required"] = true if required_field?(@method_name)
    options["aria"]["label"] = "search #{@method_name}" if field_type == "search"
      @options = options
      add_aria_describedby_values(@options)
      add_default_name_and_id(@options)
    end

    def add_aria_labelledby_for_values(tag_value, options)
      arr_labelledby= []
      options["aria"] ||= {}
      arr_labelledby << "label_#{add_default_name_and_id(options)}"
      if tag_value.nil?
        options["aria"]["labelledby"] = arr_labelledby.join(" ")
      else
        arr_labelledby << "label_#{add_default_name_and_id(options)}_#{sanitized_value(tag_value)}"
        options["aria"]["labelledby"] = arr_labelledby.join(" ")
      end
      options["aria"]["labelledby"]
    end

    def add_aria_describedby_values(options)
      arr_describedby = []
      options['aria'] ||= {}
      if options["maxlength"]
        arr_describedby << "maxlength_#{add_default_name_and_id(options)}"
	options["aria"]["describedby"] = arr_describedby.join(" ")
      end
      arr_describedby << "error_#{add_default_name_and_id(options)}" if object_has_errors?
      options["aria"]["describedby"] = arr_describedby.join(" ")
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
      
  end
end




