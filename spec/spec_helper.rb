require 'rubygems'
require 'bundler/setup'
require 'pry'

require File.expand_path("../../", __FILE__) + "/lib/rd_challenge.rb"
require 'restforce'
Dir[File.expand_path("../../", __FILE__) + "/lib/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
	config.color = true
end