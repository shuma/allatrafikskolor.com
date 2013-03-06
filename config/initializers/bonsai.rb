Tire.configure { logger 'elasticsearch.log', :level => 'debug' }
if ENV['BONSAI_INDEX_URL']
  Tire.configure do
    url "http://agmdni11:g4uollxoeowhzt7d@apricot-4753209.us-east-1.bonsai.io"
  end
  BONSAI_INDEX_NAME = ENV['BONSAI_INDEX_URL'][/[^\/]+$/]
else
  app_name = Rails.application.class.parent_name.underscore.dasherize
  app_env = Rails.env
  BONSAI_INDEX_NAME = "#{app_name}-#{app_env}"
end