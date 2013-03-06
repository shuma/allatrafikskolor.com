# Link to my stackoverflow question: http://stackoverflow.com/questions/15253773/config-tire-to-work-with-bonsai-elasticsearch-heroku-add-on/15254656#15254656
# how to config bonsai with tire : https://gist.github.com/nz/2041121
ENV['ELASTICSEARCH_URL'] = ENV['BONSAI_URL']

# Optional, but recommended: use a single index per application per environment.
# Caveat: This convention not be entirely supported throughout Tire's API.
app_name = Rails.application.class.parent_name.underscore.dasherize
app_env = Rails.env
INDEX_NAME = "#{app_name}-#{app_env}"
