# Stuff needs to be changed in Rails
module ActionView
  module Helpers
    module UserRenderOptions
      def user_options_for_rendering
        {}
      end
    end
  end
end

module ActionView
  module Helpers
    module Tags # :nodoc:
      class Base # :nodoc:
        include Helpers::UserRenderOptions
      end

      class TextField < Base # :nodoc:
        def render
          tag("input", options_for_rendering)
        end

        def options_for_rendering
          default_options_for_rendering.merge(user_options_for_rendering)
        end

        def default_options_for_rendering
          options = @options.stringify_keys
          options["size"] = options["maxlength"] unless options.key?("size")
          options["type"] ||= field_type
          options["value"] = options.fetch("value") { value_before_type_cast(object) } unless field_type == "file"
          add_default_name_and_id(options)
          options
        end
      end

      class TextArea < Base # :nodoc:
        def render
          options = options_for_rendering
          content_tag("textarea", options.delete("value") { value_before_type_cast(object) }, options)
        end

        def options_for_rendering
          default_options_for_rendering.merge(user_options_for_rendering)
        end

        def default_options_for_rendering
          options = @options.stringify_keys
          add_default_name_and_id(options)

          if size = options.delete("size")
            options["cols"], options["rows"] = size.split("x") if size.respond_to?(:split)
          end

          options
        end
      end
    end
  end
end

# This changes need to be done in WAIable
# Example of how the public method user_options_for_rendering can be used

module ActionView
  module Helpers

    module ActiveModelInstanceTag
      def required_field?(field)
        object_class = object.class
        if object_class.respond_to?(:validators_on)
          object_class.validators_on(field.intern).detect do |validator|
            validator.is_a? ActiveModel::Validations::PresenceValidator
          end.present?
        end
      end
    end

    module Tags
      class TextField
        def user_options_for_rendering
          options = {}
          options["aria-labelledby"] = "label_#{default_options_for_rendering["id"]}"
          options["aria-required"] = true if required_field?(@method_name)
          options
        end
      end

      class TextArea
        def user_options_for_rendering
          options = {}
          options["aria-labelledby"] = "label_#{default_options_for_rendering["id"]}"
          options
        end
      end
    end
  end
end
