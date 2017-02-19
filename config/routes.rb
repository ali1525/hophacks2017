Rails.application.routes.draw do
  get 'user_transactions/listAll'
  get 'user_transactions/vote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_transactions#listAll'
end
