IkonMongo::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :hows

  get "home/index"
  root to: 'home#index'

  namespace :api do
    resources :locations
    resources :products
  end

  scope '(:locale)' do

    resources :enquiries do
      collection do
        get "pre_new"
      end
      member do
        get "choose_answer"
        get "reject_answer"
        get "reply_details"
      end
    end

    namespace :account do
      resources :profiles
    end

    #namespace for admin
    #namespace :admin do
    #  root to: 'dashboard#index'
      #resources :product_categories
      #resources :products do
      #  resources :form_field_templates
      #end
      #resources :partners do
      #  member do
      #    get "delete_product"
      #    get "delete_state"
      #    get "add_product"
      #    get "add_state"
      #    post "increase_products"
      #    post "increase_states"
      #  end
      #end
    #end
    #namspace for partners
    namespace :partner do
      root to: 'enquiries#index'
      namespace :account do
        resources :profile
        resources :passwords
      end
      resources :staffs do
        member do
          get "change_branch"
        end
      end
      resources :branches
      resources :topics
      resources :enquiries do
        member do
          get "assign"
          get "answer"
          get "branches_to_assign"
          get "staffs_to_assign"
          get "submit_assign"
          put "save_answer"
          #  get "admin_show"
          #  get "send_answer"
        end
      end
      resources :statistics
    end
    #namespace for customers
    namespace :customer do
      resources :enquiries do
        collection do
          get "pre_new_products_list"

        end
        member do
          #get "get_category"
          get "choose_answer"
          get "reject_answer"
          #get "close"
          get "reply_details"
        end
      end
    end
  end

  devise_for :user
  devise_for :staff,
             :controllers => {:registrations => "partner/account/registrations",
                              :sessions => "partner/account/sessions",
                              :passwords => "partner/account/passwords",
                              :helpers => "partner/account/helpers"},
             :path => "partner/account",
             :path_names => {:sign_in => 'login'}

  devise_for :customer, :controllers => {:registrations => "account/registrations",
                                         :sessions => "account/sessions",
                                         :passwords => "account/passwords"}

  devise_for :administrator,
             :controllers => {:registrations => "admin/account/registrations",
                              :sessions => "admin/account/sessions",
                              :passwords => "admin/account/passwords",
                              :helpers => "admin/account/helpers"}
end