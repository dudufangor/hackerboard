Hackerboard::Application.routes.draw do
	root :to => "questions#index"
	controller :users do
		get "/signup", :action => :new
		post "/signup", :action => :create, :as => false
	end

	controller :sessions do
		get "/login", :action => :new
		post "/login", :action => :create, :as => false
		get "/logout", :action => :destroy
	end

	controller :questions do
		get "/questions/new", :action => :new, :as => :new_question
		post "/questions/new", :action => :create
	end
end
