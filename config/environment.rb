# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Taskcenter::Application.initialize!

# TODO fazer o css ser carregado
config.serve_static_assets = false