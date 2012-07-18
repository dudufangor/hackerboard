module Admin	
	class CategoriesController < AdminController
		def index
			@categories = Category.sorted_by_name
		end
	end
end