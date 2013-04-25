# Load the rails application.
require File.expand_path('../application', __FILE__)

# Load the app's custom environment variables here, so that they are loaded before environments/*.rb
variables = File.join(Rails.root, 'config', 'variables.rb')
load(variables) if File.exists?(variables)

# Initialize the rails application.
JobSnapper::Application.initialize!
