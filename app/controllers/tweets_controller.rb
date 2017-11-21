class TweetsController < ApplicationController
  before_action :authorization_check

  def new
    #@tweets = Tweet.delete_all
    @tweets = Tweet.where(user_id: current_user.id)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(twitter_params)
    link = current_user.tweet(@tweet)
    @tweet.link =  link.url.to_s
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to new_tweet_path
  end

  private

  def twitter_params
    params[:tweet].permit(:text, :image)
  end

  def authorization_check
      redirect_to '/auth/twitter' if current_user.nil?
  end

end
