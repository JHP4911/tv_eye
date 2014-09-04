#!/usr/bin/env ruby

# simple_tube_app.rb

# Copyright 2014 Robert Jones  (jones@craic.com)   Craic Computing LLC
# This code and associated data files are distributed freely under the terms of the MIT license

# Sinatra wrapper script that embeds a youtube video in a clean simple page without all the comments etc


require 'erb'
require 'open-uri'
# require 'json'
# require 'yaml'


$:.unshift File.join(File.dirname(__FILE__))

class SimpleTubeApp < Sinatra::Base

# def self.get_or_post(url,&block)
#   get(url,&block)
#   post(url,&block)
# end

  set :root, File.dirname(__FILE__)

  root_dir = File.dirname(__FILE__)


  set :static, true

  disable :show_exceptions

  not_found do
    erb '404'.to_sym
  end

  get '/' do
    erb :index
  end

  get '/about' do
    erb :about
  end

  # get '/index' do
  #   video_id = params[:id]
  #   erb :index
  # end

  # Embed a youtube video
  get '/watch' do

    # @base_url = 'https://www.youtube.com/watch?v='
    @youtube_id = ''
    if params[:v] =~ /v\=(\S+)/
      id = $1
      # strip off any other args is there are any
      if id =~ /^([^\&\#]+)/
        id = $1
      end
      @youtube_id = id
    else
      # just the id code - ? allow this or require the full URL
      @youtube_id = params[:v]
    end

    STDERR.puts @youtube_id

    # STDERR.puts params[:bgcolor]
    # # optional params
    # @bgcolor = '#222'
    # if params[:bgcolor] and params[:bgcolor] =~ /^[0-9a-f][0-9a-f][0-9a-f]/
    #   @bgcolor = '#' + params[:bgcolor]
    # end
    # STDERR.puts @bgcolor

    # size

    erb :watch
  end

end






