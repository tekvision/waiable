module ActionView
  module Helpers
    module Tags
      class TextField < Base # :nodoc:
        def render
          options = @options.stringify_keys
          options["size"] = options["maxlength"] unless options.key?("size")
          options["type"] ||= field_type
          options["value"] = options.fetch("value") { value_before_type_cast(object) } unless field_type == "file"
          options["value"] &&= ERB::Util.html_escape(options["value"])
          options["aria-labelledby"] = "label_#{add_default_name_and_id(options)}"
          add_default_name_and_id(options)
          tag("input", options)
        end
      end
    end
  end
end
