Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :product_specifications

  resources :specifications

  resources :notes

  resources :issues do
    get :autocomplete_manufactory_name, :on => :collection
    resources :notes
  end

  devise_for :employees

  resources :employees do
    get :myaccount, :on => :collection
    patch 'update_password', :on => :collection
  end

  resources :product_prices do
    post :catalog, :on => :collection
    get :add_price, :on => :member
    get :calculate, :on => :collection
  end


  resources :products do
    resources :photos
    get :select, :on => :collection
    get :search, :on => :collection
    post :merge, :on => :member
    get :concat, :on => :collection

  end


  resources :stock_taking_items


  resources :stock_takings do
    resources :stock_taking_items
    get :get_stock, :on => :member
    get :entering, :on => :member
    post :save_quantity, :on => :member
  end


  resources :manufactories do
    delete :remove_customer, :on => :member
    post :add_customer, :on => :member
    get :autocomplete_customer_name, :on => :collection
    get :print, :on => :member
  end


  resources :accessories do
    resources :photos
    get :select, :on => :collection
    get :search, :on => :collection
  end


  resources :sales_sheets do
    get :autocomplete_customer_phone, :on => :collection
    get :autocomplete_product_name, :on => :collection
    post :add_product, :on => :member
    post :add_customer, :on => :member
    get :reset_customer, :on => :member
    resources :sales_sheet_items
    resources :customers do
      get :select, :on => :member
      get :search, :on => :collection
      post :search, :on => :collection
    end
    get :calculate, :on => :member
    get :entering, :on => :member
    get :print, :on => :member
    collection do
      get :calc_discount
    end
  end
  resources :sales_sheet_items
  resources :customers do
    get :select, :on => :collection
    get :search, :on => :collection
  end

  resources :stock_journals
  resources :godown_entries do
    resources :godown_items
    get :entering, :on => :member
    get :calculate, :on => :member
  end
  resources :godown_items
  resources :stocks do
    get :serials, :on => :member
    get :add_serials, :on => :member
    resources :stock_journals
  end
  resources :warehouses do
    resources :stocks
    get :correct, :on => :member
  end
  resources :homes, :quick_gos
  resources :photos

  resources :guitars do
    resources :photos
    get :select, :on => :collection
    get :search, :on => :collection
  end
  resources :serial_products do
    post :batch_add, :on => :collection
    resources :photos
    resources :guitars
  end
  resources :reports do
    collection do
      get :sales_monthly, :catalog_summary, :sales_summary, :sales_employee, :new_cost_report_col
      get ':action'
    end
  end
  resources :static_reports do
  end

  resource :catalog

  root :to => 'homes#index'

end
