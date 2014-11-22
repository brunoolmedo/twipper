class TweetsController < ApplicationController

	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
		@tweets = current_user.tweets
	end

	def create

		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		@tweet.save

		#@tweet = Tweet.create(tweet_params)
		@tweets = current_user.tweets
		flash[:success] = "You have created a tweet"
		render 'new'

	end

	def index
		@tweets = Tweet.all.reject {|tweet| tweet.user == current_user}
	end

	private

# last thing written is returned - in this case, tweet.require...
	def tweet_params
		params.require(:tweet).permit(:tweet)
	end

end
