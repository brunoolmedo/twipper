class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
		@tweets = Tweet.all 
	end

	def create
		@tweet = Tweet.create(tweet_params)
		@tweets = Tweet.all 
		flash[:success] = "You have created a tweet"
		render 'new'

	end

# last thing written is returned - in this case, tweet.require...
	def tweet_params
		params.require(:tweet).permit(:tweet)
	end

end
