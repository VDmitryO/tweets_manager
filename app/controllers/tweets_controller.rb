class TweetsController < ApplicationController
  before_action :authorization_check

  def new
    #@tweets = Tweet.delete_all
    @tweets = Tweet.where(user_id: current_user.id).order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(twitter_params)
    if @tweet.save
      link = current_user.tweet(@tweet)
      @tweet.update(link: link.url.to_s, user_id: current_user.id )
      redirect_to new_tweet_path, notice: 'Tweet was successfully created.'
    else
      redirect_to new_tweet_path, alert: 'Tweet was not created!Check the tweet'
    end
  end

  private

  def twitter_params
    params[:tweet].permit(:text, :image)
  end

  def authorization_check
      redirect_to '/auth/twitter' if current_user.nil?
  end

end
