ENV['http://agmdni11:g4uollxoeowhzt7d@apricot-4753209.us-east-1.bonsai.io'] = ENV['BONSAI_URL']

# Optional, but recommended: use a single index per application per environment.
# Caveat: This convention not be entirely supported throughout Tire's API.
app_name = Rails.application.class.parent_name.underscore.dasherize
app_env = Rails.env
INDEX_NAME = "#{app_name}-#{app_env}"
