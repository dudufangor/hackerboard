Hackerboard::Application.routes.draw do
	root :to => "questions#index"
	controller :users do
		get "/signup", :action => :new
		post "/signup", :action => :create, :as => false
	end

	controller :sessions do
		get "/login", :action => :new
		post "/login", :action => :create, :as => false
	end
end
