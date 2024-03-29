# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	# Return a title on a per-page basis.
	def title
		base_title = "Ruby on Rails sample app"
		if @title.nil?
			base_title
		else
		"#{base_title} | #{@title}"
		end
	end
	
	def logo
		logo =image_tag("rails.png", :alt => "Sample App", :class => "round")
	end
end
