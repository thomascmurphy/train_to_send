TrainToSend::Application.routes.draw do

  get 'home/index'

  devise_for :users, controllers: { sessions: "users/sessions" }

  authenticate :user do
    resources :climbs do
      get "delete"

      resources :attempts
    end
    get 'quick_send', to: 'climbs#quick_new', as: 'climbs_quick_send_new'
    post 'quick_send', to: 'climbs#quick_create', as: 'climbs_quick_send_create'
    get 'sync_mountain_project', to: 'climbs#sync_mountain_project', as: 'climbs_sync_mountain_project'

    resources :exercise_metrics do
      get "delete"
    end

    resources :exercises, only: [:index, :new, :create, :edit, :update, :destroy] do
      get "delete"
      get "duplicate"
    end

    resources :workouts, only: [:index, :new, :create, :edit, :update, :destroy] do
      get "delete"
      get "duplicate"
      get "assign", to: 'workouts#assign_new'
      post "assign", to: 'workouts#assign_create'
    end

    resources :macrocycles, only: [:index, :new, :create, :edit, :update, :destroy], :path => "plans" do
      get "delete"
      get "duplicate"
      get "assign", to: 'macrocycles#assign_new'
      post "assign", to: 'macrocycles#assign_create'
    end

    resources :events do
      get "delete"
      get "complete"
      get "print"
    end
    get 'gym_session', to: 'events#gym_session_new'
    post 'gym_session', to: 'events#gym_session_create'
    get 'self_assessment', to: 'events#self_assessment'
    get 'self_assessment/new', to: 'events#self_assessment_new', as: 'self_assessment_new'

    get 'profile', to: 'profile#show'
    get 'profile/edit', to: 'profile#edit'
    get 'profile/start_mountain_project', to: 'profile#start_mountain_project'
    patch 'profile/connect_mountain_project', to: 'profile#connect_mountain_project'
    get 'profile/disconnect_mountain_project', to: 'profile#disconnect_mountain_project'
    get 'profile/progress', to: 'profile#progress'
    get 'profile/:user_id/progress', to: 'profile#progress', as: 'profile_user_progress'
    get 'profile/:user_id/schedule', to: 'profile#schedule', as: 'profile_user_schedule'
    get 'profile/:user_id/events/new', to: 'events#new', as: 'profile_user_events_new'
    get 'profile/:user_id/events/create', to: 'events#create', as: 'profile_user_events_create'
    patch 'profile', to: 'profile#update'

    resources :user_coaches, :path => "coaches", only: [:new, :create, :destroy] do
      get "delete"
    end
    get "coaches/my_students", to: 'user_coaches#my_students'


    resources :users, only: [:index, :show] do
      get "impersonate"
    end
    get "stop_impersonating", to: 'users#stop_impersonating'

    resources :item_shares, :path => "share" do
      get "accept"
      get "reject"
    end

    get 'community/training', to: 'community#training'
    get 'community/my_users', to: 'community#my_users'
    get 'community/my_followers', to: 'community#my_followers'
    get 'community/users/follow/:user_id', to: 'community#user_follow', as: 'community_user_follow'
    get 'community/users/unfollow/:user_id', to: 'community#user_unfollow', as: 'community_user_unfollow'

    resources :goals do
      get "delete"
    end

    resources :messages, only: [:new, :create, :edit, :update, :destroy] do
      get "delete"
    end
    get 'inbox/unread', to: 'messages#inbox_unread', as: 'messages_inbox_unread'
    get 'inbox', to: 'messages#inbox', as: 'messages_inbox'

    resources :votes, only: [:new]

    resources :articles, only: [:new, :create, :edit, :update, :destroy] do
      get "delete"
    end

    get 'comment', to: 'comments#new'
    post 'comment', to: 'comments#create'

    get 'onboarding', to: 'users#onboarding'
    get 'onboarding_skip', to: 'users#onboarding_skip'

  end

  resources :messages, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :exercises, only: [:show]
  resources :workouts, only: [:show]
  resources :macrocycles, only: [:show], :path => "plans"
  get 'community/users', to: 'community#users'
  get 'community/users/:user_id', to: 'community#user', as: 'community_user'

  get 'privacy_policy', to: 'home#privacy_policy'
  get 'terms_of_service', to: 'home#terms_of_service'



  root to: "home#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
