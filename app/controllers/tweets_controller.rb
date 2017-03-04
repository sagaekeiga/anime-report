class TweetsController < ApplicationController
  before_action :twitter_client, except: :new
  require 'open-uri'
  
  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(create_params)
    post_tweets_path
  end



  private
  def create_params
    params.require(:tweet).permit(:text, :image)
  end
  

  def twitter_client
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "5UsgucSdL9yzkHLdpxGTthfBg"
    config.consumer_secret     = "g8n1QPviyy6bpG55MkbLh9g6QfKV2aKl1ZQEJ6VUXLTeSuAsch"
    config.access_token        = "838030459871223811-wlz0KWpsigG7YDu0BXAwUsw1j3lSpTk"
    config.access_token_secret = "uSxO2FcYAO50RUzvZvoxrFsH1r32qmdDXr4xuxQhGcHcw"
    end
  end
end
