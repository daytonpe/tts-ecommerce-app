class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before it goes through with the active record call it has to run the methods dfined after before_filter
  before_filter :categories
  before_filter :brands
  
  # If you want an instance variable to be available anywhere in the app, you need to define it in the Application Controller
  def categories
  	@categories = Category.all
  end

  def brands
  	#pluck(:brand) will build our array of just brand names
  	#sort will put them in alphabetical order
  	#.uniq! will take out any duplicates
  	# There's  a small bug, however.
		# If there are no duplicate brands, .uniq! will return nil
		# So we need to add a check to redefine @brands if that happens
  	@brands = Product.pluck(:brand).sort.uniq!
  	if @brands == nil
  		@brands = Product.pluck(:brand).sort
  	end
  end

end
