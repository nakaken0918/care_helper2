Rails.application.routes.draw do

  get 'care_helper/index'
  root to: "care_helper#index"

end
