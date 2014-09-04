# Run this with 'rackup -p 4567'

require 'bundler'
Bundler.require

require 'sinatra'

require './simple_tube_app.rb'

run SimpleTubeApp.new
