require 'pry'
require 'action_view/common_methods'
require 'active_support/concern'

module Waiable
  module Base
    module Select
      extend ActiveSupport::Concern
      include CommonMethods

      included do
        def select_content_tag(option_tags, options, html_options)
          html_options = html_options.stringify_keys
html_options['aria'] = {}
html_options['aria']['required'] = true if required_field?(@method_name) == true
add_aria_describedby_values(html_options)
          add_default_name_and_id(html_options)
          options[:include_blank] ||= true unless options[:prompt] || select_not_required?(html_options)
          value = options.fetch(:selected) { value(object) }
          select = content_tag("select", add_options(option_tags, options, value), html_options)
          if html_options["multiple"] && options.fetch(:include_hidden, true)
            tag("input", :disabled => html_options["disabled"], :name => html_options["name"], :type => "hidden", :value => "") + select
          else
            select
          end
	       end
      end
    end
	 end
end


[
ActionView::Helpers::Tags::CollectionSelect,
ActionView::Helpers::Tags::GroupedCollectionSelect,
ActionView::Helpers::Tags::Select
].each do |t|
t.send :include, Waiable::Base::Select
end
