Taskcenter::Application.routes.draw do

  resources :submissions
  resources :tasks


  get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


match '/auth/:provider/callback', :to => 'session#create'
match '/auth/:provider', :to => 'session#create', as: :create_session

match 'pending' => 'tasks#pending', :as => :pendding_tasks
match 'close' => 'tasks#close', :as => :closed_tasks
match 'open' => 'tasks#open', :as => :opened_tasks
match 'task/:id/edit' => 'tasks#edit', :as => :task_edit

match 'error' => 'tasks#open'
match 'new' => 'tasks#new'
match 'show' => 'tasks#show', :as => :show_task
match 'fromStudent' => 'submissions#fromStudent', :as => :student_submissions
match 'fromTask' => 'submissions#fromTask', :as => :task_submissions
match 'students' => 'submissions#students', :as => :students

 # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
#match 'submission/:id' => 'submissions#viewstudent'

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
match 'submission/:id/submit' => 'submissions#submit', :as => :submit_submission
match 'task/:id/submission' => 'submissions#show_task_submission', :as => :show_task_submission

root :to => 'session#create'

#root :to => 'home#index'
#tasks :to => 'tasks#index'


#match '/tasks' => "tasks#pending"
#resouces :tasks, only: :show
#pending_tasks_url '/tasks/pending', :controller => 'users', :action => 'pending', :method => :get


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
