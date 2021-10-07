class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    logger.debug "-------"
    file = params[:tweet][:file].read
     @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current, file: file)
     if @tweet.save
         flash[:notice] = ''
         redirect_to tweet_path
     else
         render 'new'
     end
  end
  def destroy
     tweet = Tweet.find(params[:id])
     tweet.destroy
     redirect_to tweet_path
  end
  def show
     @tweet = Tweet.find(params[:id])
  end
  def edit
     @tweet = Tweet.find(params[:id])
  end
  def update
     file = params[:tweet][:file].read
     tweet = Tweet.find(params[:id])
     tweet.update(message: params[:tweet][:message], file: file)
     redirect_to root_path
  end
end