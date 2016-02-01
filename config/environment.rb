# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

require 'carrierwave/orm/activerecord' #this fixes the unitialized constant error in the console
