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
  end
end