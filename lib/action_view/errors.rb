require 'pry'
require 'active_support/concern'


module Waiable
  module ActionView
    module Errors

      extend ActiveSupport::Concern
      include ActionView::Helpers::TagHelper

      included do
        def full_messages
          map { |attribute, message| full_message(attribute, message) }
        end
      end

      def full_message(attribute, message)
        puts "Hello call error_full_message method"
        return message if attribute == :base
        attr_name = attribute.to_s.tr('.', '_').humanize
        attr_name = @base.class.human_attribute_name(attribute, default: attr_name)
        I18n.t(:"errors.format", {
        default:  "%{attribute} %{message}",
        attribute: attr_name,
        message:   message
      })
        content_tag :div, id: "error_#{@base.class.to_s.downcase}_#{attribute}" do
          "<a href=\"javascript:document.getElementsByName('#{@base.class.to_s.downcase}[#{attribute}]')[0].focus()\">#{attr_name + " " + message}</a>".html_safe
        end
      end

    end
  end
end

[
  ActiveModel::Errors
].each do |t|
  t.send :include, Waiable::ActionView::Errors
end
