Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "admin/payment-done/:id",    to: 'admin/payments#payment_done',   as: 'payment_done'

  namespace :api do
    namespace :v1 do
      post 'sign_up',          to: 'authentications#sign_up',          as: 'signup'
      post 'sign_in',          to: 'authentications#sign_in',          as: 'signin'
      post 'mobile-otp',       to: 'authentications#verify_mobile_otp',as: 'verify_mobile_otp'
      post 'request-otp',      to: 'authentications#request_otp',      as: 'request_otp'
      post 'update-coin',      to: 'authentications#update_coin',      as: 'update_coin'

      get  'cricket',          to: 'quizzes#cricket_quiz',             as: 'cricket'
      get  'bollywood',        to: 'quizzes#bollywood_quiz',           as: 'bollywood'
      get  'general-knowledge',to: 'quizzes#gk_quiz',                  as: 'gk'
      get  'movie',            to: 'quizzes#movies_quiz',              as: 'movie'
      get  'technology',       to: 'quizzes#technology_quiz',          as: 'technology'
      get  'image-one',        to: 'quizzes#image_boolean_one',        as: 'image_boolean_one'
      get  'image-two',        to: 'quizzes#image_boolean_two',        as: 'image_boolean_two'
      get  'swipe-celebrity',  to: 'quizzes#swipe_celebrity',          as: 'swipe_celebrity'
      get  'swipe-knowledge',  to: 'quizzes#swipe_knowledge',          as: 'swipe_knowledge'
      get  'swipe-insta',      to: 'quizzes#swipe_insta',              as: 'swipe_insta'

      post 'payment-request',  to: 'payments#payment_request',         as: 'payment'
      post 'requested-payment',to: 'payments#requested_payment',       as: 'payments'

      post 'invitation',       to: 'invitations#create_invitation',    as: 'invitation'
    end
  end
end
