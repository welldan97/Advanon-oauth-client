Rails.application.routes.draw do
  root to: redirect('/auth/advanon')

  get '/auth/:provider/callback' => 'application#authentication_callback'
end
