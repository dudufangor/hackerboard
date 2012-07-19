Hackerboard::Application.routes.draw do
	#scope "/:locale" do
		root :to => "questions#index"

		namespace :admin do
			resources :categories do
				member do
					get :remove
				end
			end
		end

		controller :feed do
			get "/feed/questions/:id", :action => :replies, :as => :replies_feed
			get "/feed/questions", :action => :questions, :as => :questions_feed
			get "/feed/categories/:id", :action => :categories, :as => :category_feed	
		end

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

		controller :categories do 
			get "/category/:id", :action => :show, :as => :category
		end

		controller :questions do
			get "/questions", :action => :index, :as => :questions
			get "/questions/new", :action => :new, :as => :new_question
			post "/questions/new", :action => :create, :as => false
			get "/questions/search", :action => :search, :as => :search_questions
			get "/questions/:id", :action => :show, :as => :question
		end

		controller :replies do
			post "/questions/:question_id/replies/new", :action => :create, :as => :new_reply

		end	
	#end
end
