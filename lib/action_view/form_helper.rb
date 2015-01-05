module ActionView
  module Helpers
    module FormTagHelper

      def label_tag(name = nil, content_or_options = nil, options = nil, &block)
        if block_given? && content_or_options.is_a?(Hash)
          options = content_or_options = content_or_options.stringify_keys
        else
          options ||= {}
          options = options.stringify_keys
        end
        options["for"] = sanitize_to_id(name) unless name.blank? || options.has_key?("for")
        options["id"]  = "label_#{options['for']}" if options.has_key?("for")
        content_tag :label, content_or_options || name.to_s.humanize, options, &block
      end

    end

    module Tags
      class TextField < Base # :nodoc:
        def render
          options = @options.stringify_keys
          options["size"] = options["maxlength"] unless options.key?("size")
          options["type"] ||= field_type
          options["value"] = options.fetch("value") { value_before_type_cast(object) } unless field_type == "file"
          options["value"] &&= ERB::Util.html_escape(options["value"])
          options["aria-labelledby"] = ["label_#{add_default_name_and_id(options)}"]
          add_default_name_and_id(options)
          tag("input", options)
        end
      end
    end
  end
end
