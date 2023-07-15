Rails.application.routes.draw do

  devise_for :users

  root to: "care_helper#index"

end
