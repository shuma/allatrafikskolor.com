OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '294980710610666', '865e81cb43e2fd4fbfebb8d7e951ad13', 
  scope: 'email,publish_actions'
end

