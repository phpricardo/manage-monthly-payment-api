Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bills
      resources :enrollments

      resources :students
      get "students/:page/:count", to: "students#index"
    end
  end
end
