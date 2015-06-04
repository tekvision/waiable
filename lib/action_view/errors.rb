require 'pry'
require 'action_view/helpers/tag_helper'
require 'action_view/context'
require 'active_support/concern'


module Waiable
  module Errors

    extend ActiveSupport::Concern
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    included do
      def full_messages
        map { |attribute, message| error_full_message(attribute, message) }
      end
    end  

    def error_full_message(attribute, message)
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

[
  ActiveModel::Errors
].each do |t|
  t.send :include, Waiable::Errors
end
