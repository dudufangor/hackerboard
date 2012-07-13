Hackerboard::Application.routes.draw do
	root :to => "questions#index"
	controller :users do
		get "/signup", :action => :new
		post "/signup", :action => :create, :as => false
		get "/users/:id", :action =>  :show, :as => :user

	end

	controller :sessions do
		get "/login", :action => :new
		post "/login", :action => :create, :as => false
		get "/logout", :action => :destroy
	end

	controller :questions do
		get "/questions", :action => :index, :as => :questions
		get "/questions/new", :action => :new, :as => :new_question
		post "/questions/new", :action => :create, :as => false
		get "/questions/:id", :action => :show, :as => :question
	end

	controller :replies do
		post "/questions/:question_id/replies/new", :action => :create, :as => :new_reply

	end	
end
