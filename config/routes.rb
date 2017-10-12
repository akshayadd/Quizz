Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post 'sign_up',          to: 'authentications#sign_up',          as: 'signup'
      post 'sign_in',          to: 'authentications#sign_in',          as: 'signin'
      post 'check_mobile_otp', to: 'authentications#check_mobile_otp', as: 'check_mobile_otp'
      post 'request_otp',      to: 'authentications#request_otp',      as: 'request_otp'

      get  'page-one',         to: 'quizzes#page_one',                 as: 'page_one'
      get  'page-two',         to: 'quizzes#page_two',                 as: 'page_two'
      get  'page-three',       to: 'quizzes#page_three',               as: 'page_three'
      get  'page-four',        to: 'quizzes#page_four',                as: 'page_four'
      get  'page-five',        to: 'quizzes#page_five',                as: 'page_five'
      get  'page-six',         to: 'quizzes#page_six',                 as: 'page_six'
      get  'page-seven',       to: 'quizzes#page_seven',               as: 'page_seven'
      get  'page-eight',       to: 'quizzes#page_eight',               as: 'page_eight'
      get  'page-nine',        to: 'quizzes#page_nine',                as: 'page_nine'
      get  'page-ten',         to: 'quizzes#page_ten',                 as: 'page_ten'
    end
  end
end
