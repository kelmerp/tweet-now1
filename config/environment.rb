# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'twitter'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key = "lBg1Pmkj6bddYRCuwkuRWA"
  config.consumer_secret = "5Fa7lLxpru1nwklyd6d6ww01b10lDdMb01oenTgV8"
  config.access_token = "1339877580-lhXfju7ydaGDJAfjJt8BaxhP0N3t6U6RR1U8HBo"
  config.access_token_secret = "ufGdmUp8vZVdJ9PXzfXNb6s8C67AA8Eyh14wLs1LBo"
end
