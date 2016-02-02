require "#{Rails.root}/lib/advanon"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :advanon, Rails.application.secrets.advanon_app_id, Rails.application.secrets.advanon_secret
end
