require 'pry'

module Waiable
	module Base
		def add_default_name_and_id(options)
			super
			options["aria-labelledby"] = "label_#{options["id"]}"
		end
	end
end

[ 
	ActionView::Helpers::Tags::TextField,
	ActionView::Helpers::Tags::TextArea
].each do |t|
	t.send :include, Waiable::Base
end
