# Load the Rails application.
require 'net/http'
require_relative 'application'
# Initialize the Rails application.
Rails.application.initialize!
require 'carrierwave/orm/activerecord'
