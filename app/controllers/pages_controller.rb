class PagesController < ApplicationController
  def home
	@title = "HOME"
  end

  def contact
	@title = "Contact"
  end

  def about
	@title ="About"
  end

  def helf
	@title = "Help"
  end

end
